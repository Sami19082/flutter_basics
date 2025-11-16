
import 'package:get/get.dart';

class CounterController extends GetxController {
  // You can now add your GetX logic here
  var count = 0.obs; // .obs makes the variable reactive

  void increment() {
    count++;
  }

  void decrement(){
    count--;
  }
}
