import 'package:flutter/material.dart';
import 'package:rachac/models/conta.dart';

class PaginaConta extends StatelessWidget {
  static const routeName = '/pagina_conta';

  @override
  Widget build(BuildContext context) {
    final conta = ModalRoute.of(context).settings.arguments as Conta;

    return Scaffold(
      appBar: AppBar(
        title: Text(conta.title),
      ),
    );
  }
}
