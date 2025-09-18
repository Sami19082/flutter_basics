import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  // int _counter = 0;
  //
  // /// Using Getter Setter
  // set countValue(int value) {
  //   _counter = value;
  //   notifyListeners();
  // }
  //
  // int get countValue => _counter;

// int getCountValue() {
//   return _counter;
// }

// ///Events
// void incrementCounter() {
//   _counter++;
//   notifyListeners();
// }
//
// void decrementCounter() {
//   if (_counter > 0) {
//     _counter--;
//     notifyListeners();
//   }
// }

///Managing complex data like list of maps with provider
  ///using ChangeNotifierProvider
final List<Map<String, dynamic>> _arrData = [];

void addTodo( Map<String, dynamic> newTask ){
  _arrData.add(newTask);
  notifyListeners();
}

void editTodo (int index, Map<String, dynamic> newTask){
  _arrData[index] = newTask;
  notifyListeners();
}

void removeTodo(int index){
  _arrData.removeAt(index);
  notifyListeners();
}

List<Map<String, dynamic>> get mData => _arrData;
}
