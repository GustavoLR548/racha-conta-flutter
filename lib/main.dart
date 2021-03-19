import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/screens/homepage.dart';
import 'package:rachac/screens/pagina_conta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Contas(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (ctx) => HomePage(),
            PaginaConta.routeName: (ctx) => PaginaConta(),
          }),
    );
  }
}
