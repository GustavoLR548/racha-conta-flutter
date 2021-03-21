import 'package:flutter/material.dart';
import 'package:rachac/widget/DialogBox/DialogBox.dart';

class DialogBoxTextField extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function onSubmitted;
  final double width;
  final double height;

  DialogBoxTextField(
      {this.title,
      this.initialValue = '',
      this.onSubmitted,
      this.width = 300,
      this.height = 300});
  @override
  _DialogBoxTextFieldState createState() => _DialogBoxTextFieldState();
}

class _DialogBoxTextFieldState extends State<DialogBoxTextField> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String initialValue;

  static const minLength = 3;
  static const maxLength = 15;

  void initState() {
    this.initialValue = widget.initialValue;
    super.initState();
  }

  _save(BuildContext ctx) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onSubmitted(initialValue);
      Navigator.of(ctx).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogBox(
      width: widget.width,
      height: widget.height,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: initialValue,
                decoration: InputDecoration(labelText: 'Título'),
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  initialValue = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'O \'Título\' não pode ser vazio';
                  } else if (value.length < minLength ||
                      value.length > maxLength) {
                    return 'O \'Título\' deve ser entre $minLength e $maxLength caractéres de tamanho';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => _save(context), child: Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
