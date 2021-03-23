import 'package:flutter/material.dart';
import 'package:rachac/widget/DialogBox/DialogBox.dart';

class DialogBoxTextField extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function onSubmitted;
  final Function validator;
  final TextInputType keyboardType;
  final double width;
  final double height;

  DialogBoxTextField(
      {this.title = ' ',
      this.initialValue = '',
      @required this.onSubmitted,
      @required this.validator,
      this.keyboardType = TextInputType.name,
      this.width = 300,
      this.height = 300});
  @override
  _DialogBoxTextFieldState createState() => _DialogBoxTextFieldState();
}

class _DialogBoxTextFieldState extends State<DialogBoxTextField> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String initialValue;

  void initState() {
    this.initialValue = widget.initialValue;
    super.initState();
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
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: initialValue,
                decoration: InputDecoration(
                    labelText: '',
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    errorStyle: Theme.of(context).textTheme.bodyText2),
                keyboardType: widget.keyboardType,
                onSaved: (value) {
                  initialValue = value;
                },
                validator: widget.validator,
              ),
            ),
            ElevatedButton(
                onPressed: () => _save(context),
                child: Text(
                  'Salvar',
                  style: Theme.of(context).textTheme.bodyText1,
                ))
          ],
        ),
      ),
    );
  }

  _save(BuildContext ctx) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onSubmitted(initialValue);
      Navigator.of(ctx).pop();
    }
  }
}
