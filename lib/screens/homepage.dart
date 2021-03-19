import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/widget/MyBottomSheet.dart';
import 'package:rachac/widget/contaCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';

  Future<String> _createTodo(BuildContext appCtx) async {
    final dados = await showModalBottomSheet(
        context: appCtx, builder: (modalBottomSheetCtx) => MyBottomSheet());
    return dados;
  }

  Widget build(BuildContext context) {
    final allContas = Provider.of<Contas>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Racha Conta'),
      ),
      body: allContas.items.length == 0
          ? _noConta()
          : _showConta(allContas.items),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createTodo(context).then((value) {
            final split = value.split("|");
            allContas.add(split[0], int.parse(split[1]));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _noConta() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Você não adicionou nenhuma conta...',
                textAlign: TextAlign.center),
            Text('Adicione alguma :-)', textAlign: TextAlign.center),
          ]),
    );
  }

  _showConta(List<Conta> allContas) {
    return ListView.builder(
      itemCount: allContas.length,
      itemBuilder: (ctx, index) => ContaCard(allContas[index]),
    );
  }
}
