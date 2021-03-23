import 'package:flutter/material.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/widget/Homepage/AddConta.dart';
import 'package:provider/provider.dart';
import 'package:rachac/widget/Homepage/ShowConta.dart';

class OpenContas extends StatelessWidget {
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
        title: Text(
          'Racha Conta',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: FutureBuilder(
          future: allContas.fetchData(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ShowConta();
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createTodo(context).then((value) {
            if (value != null) if (value.isNotEmpty) {
              final split = value.split("|");
              allContas.add(split[0], int.parse(split[1]));
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
