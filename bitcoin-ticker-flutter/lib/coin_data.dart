import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'UAH'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static List<DropdownMenuItem<String>> getCurrencyMenuItems() {
    List<DropdownMenuItem<String>> retVal = [];
    for (String value in currenciesList)
      retVal.add(DropdownMenuItem(child: Text(value), value: value));
    return retVal;
  }

  static List<Text> getCurrencyTextItems() {
    List<Text> retVal = [];
    for (String value in currenciesList) retVal.add(Text(value));
    return retVal;
  }
}
