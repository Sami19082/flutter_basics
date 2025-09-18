import 'dart:io';
import 'dart:math';

// void main(){
//
//   stdout.write("Enter a number to check for the prime number");
//   int a = int.parse(stdin.readLineSync().toString());
//   bool isPrime = true;
//   int counter = (a~/2).toInt();
//   for( int i = 2; i <= counter; i ++  ){
//     if(a%i==0){
//       isPrime = false;
//       break;
//     }
//   }
//   if(isPrime){
//     stdout.write("The number is prime");
//   }else{
//     stdout.write("The number is not prime");
//   }
// }

//terms of odd numbers
// void main(){
//
//   stdout.write("enter the term of which you want the even numbers");
//   int terms = int.parse(stdin.readLineSync().toString());
//   int evenCount = 0;
//   int no = 1;
//
//   while (evenCount < terms){
//     if( no%2!=0 ){
//       evenCount++;
//       stdout.write("$no \n");
//     }
//     no++;
//   }
// }

// void main(){
//   stdout.write("enter a number before which you want all the odd number");
//   List<int>listOdd = [];
//
//   int upperRange = int.parse(stdin.readLineSync().toString());
//
//   for( int a = 1; a <= upperRange; a++ ){
//     if(a%2!=0){
//       listOdd.add(a);
//     }
//   }
//   stdout.write(listOdd.toString());
// }

// void main (){
//
//   List<int> listOdd = [];
//   List<int> listEven = [];
//   stdout.write("enter the lower range number to find the odd numbers");
//   int lowerRange = int.parse(stdin.readLineSync().toString());
//   stdout.write("enter the upper range number to find the odd numbers");
//   int upperRange = int.parse(stdin.readLineSync().toString());
//
//   for( int a = lowerRange; a <= upperRange; a++ ){
//     if( a%2!=0 ){
//       listOdd.add(a);
//     }else{
//       listEven.add(a);
//     }
//   }
//   stdout.write("List of Odd numbers $listOdd\n");
//   stdout.write( "List of Even numbers $listEven" );
//

// void main (){
//   stdout.write("enter the number to find the armstrong numbers");
//   int a = int.parse(stdin.readLineSync().toString());
//   int length = 0;
//   int temp = a;
//   while(temp>0){
//     temp = temp~/10;
//     length++;
//   }
//   int result = 0;
//   temp = a;
//   while(temp>0) {
//     int remainder = temp % 10;
//     result += (pow(remainder,length).toInt());
//     temp ~/= 10;
//   }
//   if(a==result){
//     stdout.write("The number is armstrong");
//   }else{
//     stdout.write("The number is not armstrong");
//   }
// }

// void main() {
//   stdout.write(
//       "enter any number before which you want to find the armstrong numbers");
//   int upperRange = int.parse(stdin.readLineSync().toString());
//   List<int> arrArmstrongNo = [];
//   for (int a = 1; a <= upperRange; a++) {
//     if (Armstrong.checkArmstrong(a)) {
//       arrArmstrongNo.add(a);
//     }
//   }
//   stdout.write(arrArmstrongNo.toString());
// }
//
// class Armstrong {
//   static bool checkArmstrong(int no) {
//     int length = 0;
//     int temp = no;
//     while (temp > 0) {
//       temp = temp ~/ 10;
//       length++;
//     }
//     int result = 0;
//     temp = no;
//     while (temp > 0) {
//       int remainder = temp % 10;
//       result += (pow(remainder, length).toInt());
//       temp ~/= 10;
//     }
//     return no == result;
//   }
// }

// void main() {
//   stdout.write(
//       "enter LowerRange  after which you want to find the armstrong numbers");
//   int lowerRange = int.parse(stdin.readLineSync().toString());
//   stdout.write(
//       "enter UpperRange before which you want to find the armstrong numbers");
//   int upperRange = int.parse(stdin.readLineSync().toString());
//   List<int> arrArmstrongNo = [];
//   for (int a = lowerRange; a <= upperRange; a++) {
//     if (Armstrong.checkArmstrong(a)) {
//       arrArmstrongNo.add(a);
//     }
//   }
//   stdout.write(arrArmstrongNo.toString());
// }
//
// class Armstrong {
//   static bool checkArmstrong(int no) {
//     int length = 0;
//     int temp = no;
//     while (temp > 0) {
//       temp = temp ~/ 10;
//       length++;
//     }
//     int result = 0;
//     temp = no;
//     while (temp > 0) {
//       int remainder = temp % 10;
//       result += (pow(remainder, length).toInt());
//       temp ~/= 10;
//     }
//     return no == result;
//   }
// }

// void main() {
//   stdout.write(
//       "enter number of terms which you want to find the armstrong numbers");
//   int terms = int.parse(stdin.readLineSync().toString());
//   int no = 1;
//   List<int> arrArmstrongNo = [];
//   while (arrArmstrongNo.length <= terms) {
//     if (Armstrong.checkArmstrong(no)) {
//       arrArmstrongNo.add(no);
//     }
//     no++;
//   }
//   stdout.write(arrArmstrongNo.toString());
// }
//
// class Armstrong {
//   static bool checkArmstrong(int no) {
//     int length = 0;
//     int temp = no;
//     while (temp > 0) {
//       temp = temp ~/ 10;
//       length++;
//     }
//     int result = 0;
//     temp = no;
//     while (temp > 0) {
//       int remainder = temp % 10;
//       result += (pow(remainder, length).toInt());
//       temp ~/= 10;
//     }
//     return no == result;
//   }
// }

// void main(){
//   stdout.write("enter the name to find the palindrome name");
//   String name = stdin.readLineSync().toString();
//   String reverseName = name.toLowerCase().split('').reversed.join().toUpperCase();
//   if( name == reverseName ){
//     stdout.write("The name is palindrome");
//   }else{
//     stdout.write("The name is not palindrome");
//   }
// }

// void main() {
//   stdout.write("Enter a number to find the palindrome");
//   int myNo = int.parse(stdin.readLineSync().toString());
//
//   if (Palindrome().checkforpalindrome(no: myNo)) {
//     stdout.write("The number is palindrome");
//   } else {
//     stdout.write("The number is not palindrome");
//   }
// }
//
// class Palindrome {
//   bool checkforpalindrome({required int no}) {
//     int temp = no;
//     int result = 0;
//     while (temp > 0) {
//       int remainder = temp % 10;
//       result = (result * 10) + remainder;
//       temp = temp ~/ 10;
//     }
//     return no == result;
//   }
// }

// void main() {
//   stdout.write("Enter the no of terms of fabonacci series");
//   int terms = int.parse(stdin.readLineSync().toString());
//   int n1 = 0;
//   int n2 = 1;
//   List<int> listFabonacci = [n1, n2];
//   for (int a = 2; a < terms; a++) {
//     int n3 = n1 + n2;
//     listFabonacci.add(n3);
//     n1 = n2;
//     n2 = n3;
//   }
//   stdout.write(listFabonacci.toString());
// }
