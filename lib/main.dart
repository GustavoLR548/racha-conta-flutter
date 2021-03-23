import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rachac/provider/contas.dart';
import 'package:rachac/screens/OpenContas.dart';
import 'package:rachac/screens/EditarConta.dart';
import 'package:rachac/screens/Resultado.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Contas(),
      child: MaterialApp(
          title: 'Racha conta',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            canvasColor: Color(0xffebead1),
            fontFamily: 'NotoSansJP',
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                  headline3: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  headline2: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  bodyText1: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  bodyText2: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.normal),
                ),
          ),
          initialRoute: OpenContas.routeName,
          routes: {
            OpenContas.routeName: (ctx) => OpenContas(),
            EditarConta.routeName: (ctx) => EditarConta(),
            Resultado.routeName: (ctx) => Resultado(),
          }),
    );
  }
}
