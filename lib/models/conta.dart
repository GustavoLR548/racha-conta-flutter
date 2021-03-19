import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';

class Conta with ChangeNotifier {
  final String _creationDate;
  String _title;
  double _fullPrice;
  int _numberOfPeople;
  double _waiterPorcentage;
  bool _foiPaga;

  Conta(this._creationDate, this._title, this._numberOfPeople);

  String get id {
    return this._creationDate;
  }

  String get title {
    return this._title;
  }

  double get fullPrice {
    return this._fullPrice;
  }

  String get creationDate {
    DateTime date = DateTime.parse(_creationDate);
    return DateFormat("dd/MM/yyyy - HH:mm").format(date);
  }

  String get creationDateDay {
    DateTime date = DateTime.parse(_creationDate);
    return DateFormat("dd/MM").format(date);
  }

  int get numberOfPeople {
    return this._numberOfPeople;
  }

  double get waiterPorcentage {
    return this._waiterPorcentage;
  }

  bool get foiPaga {
    return this._foiPaga;
  }

  set title(String title) {
    this._title = title;
  }

  set fullPrice(double fullPrice) {
    this._fullPrice = fullPrice;
  }

  set numberOfPeople(int numberOfPeople) {
    this._numberOfPeople = numberOfPeople;
  }

  set waiterPorcentage(double waiterPorcentage) {
    this._waiterPorcentage = waiterPorcentage;
  }

  set foiPaga(bool foiPaga) {
    this._foiPaga = foiPaga;
  }
}
