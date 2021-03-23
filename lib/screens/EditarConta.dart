import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/provider/contas.dart';
import 'package:provider/provider.dart';
import 'package:rachac/screens/Resultado.dart';
import 'package:rachac/widget/DialogBox/DialogBoxTextField.dart';
import 'package:rachac/widget/EditarConta/ContaForm.dart';

class EditarConta extends StatelessWidget {
  static const routeName = '/pagina_conta';

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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'O \'Título\' não pode ser vazio';
                          } else if (value.length < 3 || value.length > 15) {
                            return 'O \'Título\' deve ser entre 3 e 15 caractéres de tamanho';
                          }
                          return null;
                        },
                      ))),
          centerTitle: true,
        ),
        body: ContaForm(_calcularTotalAPagar, contaAtual));
  }

  _calcularTotalAPagar(BuildContext context, Conta c) {
    Provider.of<Contas>(context, listen: false).update(c);

    Navigator.of(context).pushNamed(Resultado.routeName, arguments: c);
  }
}
