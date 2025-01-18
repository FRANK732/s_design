import 'package:flutter/material.dart';

class SDropdownController extends ChangeNotifier{
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  void setOpen(bool open){
    if(_isOpen != open){
      _isOpen = open;
      notifyListeners();
    }
  }
}