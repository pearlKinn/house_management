import 'package:intl/intl.dart';

String formatNumber(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
}

int strNumber(dynamic s){
  int num = 0;
  try {
    num = int.parse(s); 
  } catch (e) {
    print(e); 
  }
  return num;

}