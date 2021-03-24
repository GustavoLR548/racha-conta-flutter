import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';

class Conta with ChangeNotifier {
  final String _creationDate;
  String _title;
  double _fullPrice;
  double _waiterPercentage;
  double _drinkPrice;
  int _numberOfPeople;
  int _numberOfPeopleWhoDrink;
  bool _arquivada;

  Conta(this._creationDate, this._title, this._numberOfPeople);

  Conta.complete(
      this._creationDate,
      this._title,
      this._fullPrice,
      this._numberOfPeople,
      this._waiterPercentage,
      this._numberOfPeopleWhoDrink,
      this._drinkPrice,
      this._arquivada);

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

  int get numberOfPeopleWhoDrink {
    if (this._numberOfPeopleWhoDrink == null) return 0;
    return this._numberOfPeopleWhoDrink;
  }

  double get waiterPercentage {
    if (this._waiterPercentage == null) return 0;
    return this._waiterPercentage;
  }

  double get drinkPrice {
    if (this._drinkPrice == null) return 0;
    return this._drinkPrice;
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

  set numberOfPeopleWhoDrink(int numberOfPeopleWhoDrink) {
    this._numberOfPeopleWhoDrink = numberOfPeopleWhoDrink;
  }

  set drinkPrice(double drinkPrice) {
    this._drinkPrice = drinkPrice;
  }

  set waiterPercentage(double waiterPercentage) {
    this._waiterPercentage = waiterPercentage;
  }

  set arquivada(bool arquivada) {
    this._arquivada = arquivada;
  }

  bool canCalculate() {
    return (fullPrice != 0 || waiterPercentage != 0 || numberOfPeople != 0) ||
        (numberOfPeopleWhoDrink != 0 || drinkPrice != 0);
  }
}
