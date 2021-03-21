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

  Conta.complete(this._creationDate, this._title, this._fullPrice,
      this._numberOfPeople, this._waiterPorcentage, this._foiPaga);

  String get id {
    if (this._creationDate == null) return '';
    return this._creationDate;
  }

  String get title {
    if (this._title == null) return '';
    return this._title;
  }

  double get fullPrice {
    if (this._fullPrice == null) return 0;
    return this._fullPrice;
  }

  String get creationDate {
    if (this._creationDate == null) return '';
    DateTime date = DateTime.parse(_creationDate);
    return DateFormat("dd/MM/yyyy - HH:mm").format(date);
  }

  String get creationDateDay {
    if (this._creationDate == null) return '';
    DateTime date = DateTime.parse(_creationDate);
    return DateFormat("dd/MM").format(date);
  }

  int get numberOfPeople {
    if (this._numberOfPeople == null) return 0;
    return this._numberOfPeople;
  }

  double get waiterPorcentage {
    if (this._waiterPorcentage == null) return 0;
    return this._waiterPorcentage;
  }

  bool get foiPaga {
    if (this._foiPaga == null) return false;
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
