import 'package:flutter/material.dart';

class NumberslistProvider extends ChangeNotifier {
  List<int> numberslist = [1, 2, 3, 4, 5];

// #add function

  void addnumbers() {
    int lastnumber = numberslist.last.toInt();
    print('last number--------->$lastnumber');
    numberslist.add(lastnumber + 1);
    notifyListeners();
  }
}
