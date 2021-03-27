import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rachac/models/conta.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/screens/EditarConta.dart';
import 'package:provider/provider.dart';
import 'package:rachac/screens/Resultado.dart';
import 'package:rachac/widget/IconDetector.dart';

class ContaCard extends StatelessWidget {
  final Conta _conta;

  const ContaCard(this._conta);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xffdec698),
        child: ListTile(
          onTap: () {
            if (!_conta.arquivada)
              Navigator.of(context)
                  .pushNamed(EditarConta.routeName, arguments: _conta.id);
          },
          leading: _buildLeading(context),
          title: Text(
            _conta.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          subtitle: _buildSubtitle(),
          trailing: _buildTrailing(context),
        ));
  }

  _buildLeading(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FittedBox(
          child: Text(
            _conta.creationDateDay,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }

  _buildSubtitle() {
    return Row(
      children: [
        Icon(Icons.people),
        Text(
          'Pessoas: ' + _conta.numberOfPeople.toString(),
        ),
      ],
    );
  }

  _buildTrailing(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconDetector(
        onTap: () =>
            Provider.of<Contas>(context, listen: false).remove(_conta.id),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      IconDetector(
        onTap: () {
          if (!_conta.canCalculate())
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: Text('Atenção!',
                          style: Theme.of(context).textTheme.headline1),
                      content: Text(
                        'Você não preencheu todos os detalhes para que o cálculo seja feito!',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ));
          else
            Navigator.of(context)
                .pushNamed(Resultado.routeName, arguments: _conta);
        },
        icon: const Icon(
          Icons.analytics,
          color: Colors.green,
        ),
      ),
    ]);
  }
}
