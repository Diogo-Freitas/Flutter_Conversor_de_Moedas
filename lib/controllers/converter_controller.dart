import 'package:flutter/material.dart';

class ConverterController {
  final TextEditingController realController = TextEditingController();
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();
  final TextEditingController bitcoinController = TextEditingController();

  late double dolarRate;
  late double euroRate;
  late double bitcoinRate;

  String errorText = '';

  Function(String)? setErrorCallback;

  void updateRates(Map response) {
    dolarRate = double.parse(response['USDBRL']['bid']);
    euroRate = double.parse(response['EURBRL']['bid']);
    bitcoinRate = double.parse(response['BTCBRL']['bid']);
  }

  void clearFields() {
    realController.clear();
    dolarController.clear();
    euroController.clear();
    bitcoinController.clear();
    setErrorCallback!('');
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    try {
      double real = double.parse(text);

      dolarController.text = (real / dolarRate).toStringAsFixed(2);
      euroController.text = (real / euroRate).toStringAsFixed(2);
      bitcoinController.text = (real / bitcoinRate).toStringAsFixed(8);

      setErrorCallback!('');
    } catch (e) {
      if (setErrorCallback != null) {
        setErrorCallback!('Digite valores válidos!');
      }
    }
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    try {
      double dolar = double.parse(text);

      realController.text = (dolar * dolarRate).toStringAsFixed(2);
      euroController.text = (dolar * dolarRate / euroRate).toStringAsFixed(2);
      bitcoinController.text = (dolar * dolarRate / bitcoinRate).toStringAsFixed(8);

      setErrorCallback!('');
    } catch (e) {
      if (setErrorCallback != null) {
        setErrorCallback!('Digite valores válidos!');
      }
    }
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    try {
      double euro = double.parse(text);

      realController.text = (euro * euroRate).toStringAsFixed(2);
      dolarController.text = (euro * euroRate / dolarRate).toStringAsFixed(2);
      bitcoinController.text = (euro * euroRate / bitcoinRate).toStringAsFixed(2);

      setErrorCallback!('');
    } catch (e) {
      if (setErrorCallback != null) {
        setErrorCallback!('Digite valores válidos!');
      }
    }
  }

  void bitcoinChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    try {
      double bitcoin = double.parse(text);

      realController.text = (bitcoin * bitcoinRate).toStringAsFixed(2);
      euroController.text = (bitcoin * bitcoinRate / euroRate).toStringAsFixed(2);
      dolarController.text = (bitcoin * bitcoinRate / dolarRate).toStringAsFixed(2);

      setErrorCallback!('');
    } catch (e) {
      if (setErrorCallback != null) {
        setErrorCallback!('Digite valores válidos!');
      }
    }
  }
}