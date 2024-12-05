import 'package:flutter/material.dart';

class ConverterController extends ChangeNotifier {
  final TextEditingController realController = TextEditingController();
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();

  void clearFields() {
    realController.clear();
    dolarController.clear();
    euroController.clear();
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }
  }
}
