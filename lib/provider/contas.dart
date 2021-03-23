import 'package:flutter/foundation.dart';
import 'package:rachac/helper/sql.dart';
import 'package:rachac/models/conta.dart';

class Contas with ChangeNotifier {
  List<Conta> _items = [];

  List<Conta> get items {
    List<Conta> result = [];
    _items.forEach((element) {
      if (!element.arquivada) result.add(element);
    });
    return result;
  }

  List<Conta> get archived {
    List<Conta> result = [];
    _items.forEach((element) {
      if (element.arquivada) result.add(element);
    });
    return result;
  }

  int get size {
    return _items.length;
  }

  void add(String title, int pessoas) {
    String creation = DateTime.now().toIso8601String();
    Conta newConta = Conta(creation, title, pessoas);

    newConta.fullPrice = 0;
    newConta.waiterPercentage = 0;
    newConta.arquivada = false;

    _items.add(newConta);
    notifyListeners();

    SQLDatabase.insert('user_rachac', _contaToMap(newConta));
  }

  Conta find(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  bool update(Conta c) {
    final contaIndex = _items.indexOf(c);

    if (contaIndex < 0) return false;

    _items[contaIndex] = c;
    notifyListeners();
    SQLDatabase.insert('user_rachac', _contaToMap(c));
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
            item['waiterPercentage'],
            (item['archived'] == 0 ? false : true)))
        .toList();
    notifyListeners();
  }

  Map<String, Object> _contaToMap(Conta c) {
    return {
      'id': c.id,
      'title': c.title,
      'fullPrice': c.fullPrice,
      'numberOfPeople': c.numberOfPeople,
      'waiterPercentage': c.waiterPercentage,
      'archived': c.arquivada ? 1 : 0
    };
  }
}
