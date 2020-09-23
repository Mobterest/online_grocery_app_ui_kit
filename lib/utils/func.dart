import 'package:intl/intl.dart';
import '../globals/config.dart';

class Func {
  Func();

  numberFormat(amount) {
    final formatter = new NumberFormat("#,###");
    return formatter.format(amount);
  }

  getSum(cart) {
    int sum = 0;
    for (var i = 0; i < cart.length; i++) {
      sum += int.parse(GROCERIES[cart[i]['index']]['price']) * cart[i]['count'];
    }
    return sum;
  }
  
}
