import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/widget/DialogBox/DialogBox.dart';
import 'package:rachac/widget/DialogBox/DialogBoxTextField.dart';
import 'package:rachac/widget/EditarConta/ExpandableBox.dart';
import 'package:rachac/widget/IconDetector.dart';

class ContaForm extends StatefulWidget {
  final Function calcularTotal;
  final Conta contaAtual;

  const ContaForm(this.calcularTotal, this.contaAtual);

  @override
  _ContaFormState createState() => _ContaFormState();
}

class _ContaFormState extends State<ContaForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Conta contaAtual;

  _verificarForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.calcularTotal(context, widget.contaAtual);
    }
  }

  void initState() {
    contaAtual = widget.contaAtual;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Text('Digite o Valor da Conta:',
                        style: Theme.of(context).textTheme.bodyText1)),
                TextFormField(
                  initialValue: contaAtual.fullPrice.toString(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: const Text('R\$'),
                      errorStyle: Theme.of(context).textTheme.bodyText2),
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
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      labelText: 'Número de pessoas',
                      errorStyle: Theme.of(context).textTheme.bodyText2),
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
                ExpandableBox([
                  Text('Álcool', style: Theme.of(context).textTheme.headline1),
                  const SizedBox(
                    width: 10,
                  ),
                  IconDetector(
                      icon: Icon(Icons.new_releases),
                      onTap: () => showDialog(
                          context: context,
                          builder: (ctx) => DialogBox(
                              height: 225,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Beberam X Não beberam álcool',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: Text(
                                      'Coloque nesse espaço o preço da bebida e o número de pessoas que beberam para separar a conta entre os dois grupos. Se você não utiilizar o espaço, apenas não use nenhumas das caixas',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  )
                                ],
                              ))))
                ], [
                  Column(
                    children: [
                      TextFormField(
                        initialValue:
                            contaAtual.numberOfPeopleWhoDrink.toString(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Número de pessoas',
                            errorStyle: Theme.of(context).textTheme.bodyText2),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          contaAtual.numberOfPeopleWhoDrink = int.parse(value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'O número de pessoas não pode ser vazio';
                          }

                          if (int.tryParse(value) == null) {
                            return 'Digite um número';
                          }

                          if (int.parse(value) < 0) {
                            return 'Digite um número';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: contaAtual.drinkPrice.toString(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixText: 'R\$',
                            errorStyle: Theme.of(context).textTheme.bodyText2),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          contaAtual.drinkPrice = double.parse(value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'O número de pessoas não pode ser vazio';
                          }

                          if (double.tryParse(value) == null) {
                            return 'Digite um número';
                          }

                          if (double.parse(value) < 0) {
                            return 'Digite um número maior ou igual a 0';
                          }

                          return null;
                        },
                      ),
                    ],
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (ctx) => DialogBoxTextField(
                              height: 215,
                              title: 'Insira a porcentagem',
                              initialValue: contaAtual.waiterPercentage
                                  .toStringAsFixed(2),
                              keyboardType: TextInputType.number,
                              onSubmitted: (value) {
                                setState(() {
                                  contaAtual.waiterPercentage =
                                      double.parse(value);
                                });
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
                            )),
                    child: Text(
                      'Porcentagem do Garçom: ' +
                          contaAtual.waiterPercentage.toStringAsFixed(2) +
                          '%',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(40))),
                  child: Slider(
                    activeColor: Color(0xffedd5a5),
                    value: contaAtual.waiterPercentage,
                    onChanged: (value) {
                      setState(() {
                        contaAtual.waiterPercentage = value;
                      });
                    },
                    min: 0,
                    max: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: Text(
                      'Calcular',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () => _verificarForm(context),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor))),
              ],
            ),
          ),
        ));
  }
}
