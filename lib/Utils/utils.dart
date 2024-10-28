import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

displayToast(
  String message,
) {
  Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      fontSize: 14,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black54,
      timeInSecForIosWeb: 1);
}

LinearGradient gradient() {
  return const LinearGradient(colors: [
    Color(0xffF4D9D0),
    Color(0xffD9ABAB),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}

String category(cat){
  return cat.map((category) => category.title).join(', ');
}
