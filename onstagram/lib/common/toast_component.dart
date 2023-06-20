import 'package:fluttertoast/fluttertoast.dart';
import 'package:onstagram/config/const.dart';

class ToastComponent {
  showToast({String? message}) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: blueColor,
        textColor: primaryColor,
        fontSize: 16);
  }
}
