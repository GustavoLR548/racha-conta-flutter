import 'package:flutter/foundation.dart';
import 'package:rachac/models/conta.dart';

class Contas with ChangeNotifier {
  List<Conta> _items = [];

  List<Conta> get items {
    _items.sort((a, b) => a.id.compareTo(b.id));
    return [...this._items];
  }

  void add(String title, int pessoas) {
    String creation = DateTime.now().toIso8601String();
    Conta newConta = Conta(creation, title, pessoas);
    _items.add(newConta);
    notifyListeners();
  }

  bool update(Conta c) {
    final contaIndex = _items.indexOf(c);

    if (contaIndex < 0) return false;

    _items[contaIndex] = c;
    notifyListeners();
    return true;
  }

  void remove(String id) {
    _items.removeWhere((element) => element.creationDate == id);
    notifyListeners();
  }
}
