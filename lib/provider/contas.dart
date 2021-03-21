import 'package:flutter/foundation.dart';
import 'package:rachac/helper/sql.dart';
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

    newConta.fullPrice = 0;
    newConta.waiterPorcentage = 0;
    newConta.foiPaga = false;

    _items.add(newConta);
    notifyListeners();

    SQLDatabase.insert('user_rachac', {
      'id': newConta.id,
      'title': newConta.title,
      'fullPrice': newConta.fullPrice,
      'numberOfPeople': newConta.numberOfPeople,
      'waiterPercentage': newConta.waiterPorcentage,
      'foiPaga': newConta.foiPaga ? 1 : 0
    });
  }

  Conta find(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  bool update(Conta c) {
    final contaIndex = _items.indexOf(c);

    if (contaIndex < 0) return false;

    _items[contaIndex] = c;
    notifyListeners();
    return true;
  }

  void remove(String id) {
    _items.removeWhere((element) => element.id == id);
    SQLDatabase.delete('user_rachac', id);
    notifyListeners();
  }

  Future<void> fetchData() async {
    final datalist = await SQLDatabase.read('user_rachac');

    if (datalist.length == 0) return;

    _items = datalist
        .map((item) => Conta.complete(
            item['id'],
            item['title'],
            item['fullPrice'],
            item['numberOfPeople'],
            item['waiterPorcentage'],
            (item['foiPaga'] == 0 ? false : true)))
        .toList();
    notifyListeners();
  }
}
