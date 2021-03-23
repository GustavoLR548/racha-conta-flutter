import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';

class Conta with ChangeNotifier {
  final String _creationDate;
  String _title;
  double _fullPrice;
  int _numberOfPeople;
  double _waiterPercentage;
  bool _arquivada;

  Conta(this._creationDate, this._title, this._numberOfPeople);

  Conta.complete(this._creationDate, this._title, this._fullPrice,
      this._numberOfPeople, this._waiterPercentage, this._arquivada);

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

  double get waiterPercentage {
    if (this._waiterPercentage == null) return 0;
    return this._waiterPercentage;
  }

  bool get arquivada {
    if (this._arquivada == null) return false;
    return this._arquivada;
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

  set waiterPercentage(double waiterPercentage) {
    this._waiterPercentage = waiterPercentage;
  }

  set arquivada(bool arquivada) {
    this._arquivada = arquivada;
  }

  bool canCalculate() {
    return fullPrice != 0 && waiterPercentage != 0 && numberOfPeople != 0;
  }
}
