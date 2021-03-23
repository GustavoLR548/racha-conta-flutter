import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';
import 'package:provider/provider.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/widget/Homepage/ContaCard/ContaCard.dart';

class ShowConta extends StatefulWidget {
  @override
  _ShowContaState createState() => _ShowContaState();
}

class _ShowContaState extends State<ShowConta> {
  bool showArchived = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Contas>(
        child: _noConta(context),
        builder: (ctx, contas, ch) {
          if (contas.size == 0) {
            return ch;
          } else {
            return _showConta(!showArchived ? contas.items : contas.archived);
          }
        });
  }

  _noConta(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/guy.png',
              alignment: FractionalOffset(0.2, 1),
              width: 200,
              height: 200,
            ),
            Text(
              'Você não tem conta...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text('Adicione alguma :-)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1),
          ]),
    );
  }

  _showConta(List<Conta> allContas) {
    return SingleChildScrollView(
      child: Center(
        child: Column(children: [
          Text(
            !showArchived ? 'Ativos' : 'Arquivados',
            style: Theme.of(context).textTheme.headline1,
          ),
          Switch(
              value: showArchived,
              onChanged: (value) {
                setState(() {
                  showArchived = value;
                });
              }),
          allContas.length == 0
              ? const Text('Nenhuma Conta registrada aqui')
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: allContas.length,
                  itemBuilder: (ctx, index) => ContaCard(allContas[index]),
                ),
        ]),
      ),
    );
  }
}
