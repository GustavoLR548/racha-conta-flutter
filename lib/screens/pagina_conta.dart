import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/provider/contas.dart';
import 'package:provider/provider.dart';
import 'package:rachac/widget/DialogBox/DialogBoxTextField.dart';

class PaginaConta extends StatefulWidget {
  static const routeName = '/pagina_conta';

  @override
  _PaginaContaState createState() => _PaginaContaState();
}

class _PaginaContaState extends State<PaginaConta> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  _calcularTotalAPagar() {}

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Contas>(context);
    final contaId = ModalRoute.of(context).settings.arguments as String;
    final contaAtual = provider.find(contaId);

    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
              child: Text(contaAtual.title),
              onTap: () => showDialog(
                  context: context,
                  builder: (ctx) => DialogBoxTextField(
                        height: 215,
                        title: 'Insira o novo título',
                        initialValue: contaAtual.title,
                        onSubmitted: (value) {
                          contaAtual.title = value;
                          provider.update(contaAtual);
                        },
                      ))),
          centerTitle: true,
        ),
        body: _body(contaAtual));
  }

  Widget _body(Conta contaAtual) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: const Text('Digite o Valor da Conta:')),
                TextFormField(
                  initialValue: contaAtual.fullPrice.toString(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), prefix: const Text('R\$')),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    contaAtual.fullPrice = double.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O valor da conta não pode ser vazio';
                    }

                    if (double.tryParse(value) == null) {
                      return 'Digite um número';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: contaAtual.numberOfPeople.toString(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Número de pessoas'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    contaAtual.numberOfPeople = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O número de pessoas não pode ser vazio';
                    }

                    if (double.tryParse(value) == null) {
                      return 'Digite um número';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Porcentagem do Garçom: ' +
                    contaAtual.fullPrice.toStringAsFixed(2) +
                    '%'),
                Slider(
                  value: contaAtual.fullPrice,
                  onChanged: (value) {
                    setState(() {
                      contaAtual.fullPrice = value;
                    });
                  },
                  min: 0,
                  max: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _calcularTotalAPagar(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor))),
              ],
            ),
          ),
        ));
  }
}
