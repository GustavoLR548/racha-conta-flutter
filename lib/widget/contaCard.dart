import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/screens/pagina_conta.dart';

class ContaCard extends StatelessWidget {
  final Conta _conta;

  const ContaCard(this._conta);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(PaginaConta.routeName, arguments: _conta),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
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
        ),
      ),
    );
  }
}
