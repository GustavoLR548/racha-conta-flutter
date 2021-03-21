import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/screens/pagina_conta.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rachac/widget/DialogBox/DialogBox.dart';

class ContaCard extends StatelessWidget {
  final Conta _conta;

  const ContaCard(this._conta);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: _buildListTile(),
      actions: <Widget>[..._buildIconSlideAction(context)],
      secondaryActions: <Widget>[..._buildIconSlideAction(context).reversed],
    );
  }

  List<Widget> _buildIconSlideAction(BuildContext ctx) {
    return [
      IconSlideAction(
        caption: 'Arquivar',
        color: Colors.blue,
        icon: Icons.archive,
        onTap: null,
      ),
      IconSlideAction(
        caption: 'Editar',
        color: Colors.indigo,
        icon: Icons.border_color,
        onTap: () => Navigator.of(ctx)
            .pushNamed(PaginaConta.routeName, arguments: _conta.id),
      ),
      IconSlideAction(
          caption: 'Informação',
          color: Colors.black45,
          icon: Icons.analytics,
          onTap: () => _buildDialogBox(ctx)),
      IconSlideAction(
        caption: 'Deletar',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => Provider.of<Contas>(ctx, listen: false).remove(_conta.id),
      ),
    ];
  }

  _buildDialogBox(BuildContext ctx) {
    final deviceSize = MediaQuery.of(ctx).size.width;
    final dialogSize = deviceSize - (deviceSize / 6);
    showDialog(
        context: ctx,
        builder: (ctx) => DialogBox(
              width: dialogSize,
              height: dialogSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Informações',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  Text('Nome: ' + _conta.title),
                  Text(
                      'Número de pessoas: ' + _conta.numberOfPeople.toString()),
                  Text('Preço total: ' +
                      (_conta.fullPrice == -1
                          ? '-'
                          : _conta.fullPrice.toString())),
                  Text('Porcentagem garçom: ' +
                      (_conta.waiterPorcentage == -1
                          ? '-'
                          : _conta.waiterPorcentage.toString())),
                  Text('Foi paga: ' + (!_conta.foiPaga ? 'Não' : 'Sim'))
                ],
              ),
            ));
  }

  Widget _buildListTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            child: Text(_conta.creationDateDay),
          ),
        ),
      ),
      title: Text(_conta.title),
      subtitle: Row(
        children: [
          Icon(Icons.people),
          Text('Pessoas: ' + _conta.numberOfPeople.toString()),
        ],
      ),
    );
  }
}
