import 'package:flutter/material.dart';

class ExpandableBox extends StatefulWidget {
  final String _title;
  final List<Widget> _children;

  const ExpandableBox(this._title, this._children);

  @override
  _ExpandableBoxState createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: const Color(0xffdcdbc5),
      duration: const Duration(milliseconds: 300),
      height: _expanded ? 245 : 76,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              tileColor: Color(0xffebead1),
              title: Text(widget._title,
                  style: Theme.of(context).textTheme.headline1),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            Expanded(
              child: AnimatedContainer(
                color: const Color(0xffebead1),
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: _expanded ? 100 : 0,
                child: ListView(children: widget._children),
              ),
            )
          ],
        ),
      ),
    );
  }
}
