import 'package:flutter/material.dart';
import 'package:instax_19552011050_uts/data.dart';

class Search with ChangeNotifier {
  final List<ProdukList> listProduk;

  Search(this.listProduk) {
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty) {
        find = true;
      }
    });
  }

  bool _find = false;
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  List<ProdukList> _list = [];

  bool get find => _find;
  set find(bool newValue) {
    _find = newValue;
    notifyListeners();
  }

  FocusNode get focusNode => _focusNode;
  set focusNode(FocusNode newValue) {
    _focusNode = newValue;
    notifyListeners();
  }

  TextEditingController get textEditingController => _textEditingController;
  set textEditingController(TextEditingController newValue) {
    _textEditingController = newValue;
    notifyListeners();
  }

  List<ProdukList> get list => _list;
  set list(List<ProdukList> newValue) {
    _list = newValue;
    notifyListeners();
  }

  void operation(String findText) {
    list.clear();
    if (findText.isNotEmpty) {
      find = true;
      for (int i = 0; i < listProduk.length; i++) {
        ProdukList data = listProduk[i];
        if (data.tipe!.toLowerCase().contains(findText.toLowerCase())) {
          list.add(data);
        }
      }
    } else {
      list.clear();
      find = false;
    }
  }
}
