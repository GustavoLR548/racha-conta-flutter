import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/widget/Conta/AddConta.dart';
import 'package:rachac/widget/Conta/contaCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';

  Future<String> _createTodo(BuildContext appCtx) async {
    final dados = await showModalBottomSheet(
        context: appCtx, builder: (modalBottomSheetCtx) => AddConta());
    return dados;
  }

  Widget build(BuildContext context) {
    final allContas = Provider.of<Contas>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Racha Conta'),
      ),
      body: FutureBuilder(
          future: allContas.fetchData(),
          builder: (ctx, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Consumer<Contas>(
                  child: _noConta(),
                  builder: (ctx, contas, ch) {
                    if (contas.items.length == 0) {
                      return ch;
                    } else {
                      return _showConta(contas.items);
                    }
                  });
            }
          }),
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

  Widget _noConta() {
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

  Widget _showConta(List<Conta> allContas) {
    return ListView.builder(
      itemCount: allContas.length,
      itemBuilder: (ctx, index) => ContaCard(allContas[index]),
    );
  }
}
