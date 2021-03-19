import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _titulo;
  int _pessoas;

  static const int _minTitleLength = 3;
  static const int _maxTitleLength = 20;

  void initState() {
    _titulo = '';
    _pessoas = 0;
    super.initState();
  }

  _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pop(_titulo + "|" + _pessoas.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text('Criando uma nova conta'),
            TextFormField(
              initialValue: _titulo,
              decoration: InputDecoration(labelText: 'Título'),
              keyboardType: TextInputType.name,
              onSaved: (value) {
                _titulo = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'O \'Título\' não pode ser vazio';
                } else if (value.length < _minTitleLength ||
                    value.length > _maxTitleLength) {
                  return 'O \'Título\' deve ser entre $_minTitleLength e $_maxTitleLength caractéres de tamanho';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: _pessoas.toString(),
              decoration: InputDecoration(labelText: 'Número de pessoas'),
              keyboardType: TextInputType.name,
              onSaved: (value) {
                _pessoas = int.parse(value);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'O \'Número de pessoas\' não pode ser vazio';
                } else if (int.tryParse(value) == null) {
                  return 'Por favor, digite um número';
                } else if (int.parse(value) <= 0) {
                  return 'Por favor, digite um número maior que zero';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: _save, child: Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
