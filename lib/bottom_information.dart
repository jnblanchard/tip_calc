import 'package:flutter/material.dart';
import 'suggestion_row.dart';


IntrinsicWidth tipBottom() {
  return IntrinsicWidth(
      stepWidth: 5,
      stepHeight: 20,
      child: TextField(
        focusNode: AlwaysDisabledFocusNode(),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tip',
          suffixText: "tip",
          hintStyle: TextStyle(fontSize: 22.0),
          suffixStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white70),
        ),
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.green[200],
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
        autofocus: false,
        autocorrect: false,
      ));
}

IntrinsicWidth totalBottom() {
  return IntrinsicWidth(
      stepWidth: 5,
      stepHeight: 20,
      child: TextField(
        focusNode: AlwaysDisabledFocusNode(),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Total',
            hintStyle: TextStyle(fontSize: 22.0),
            prefixIcon:
            Icon(Icons.attach_money, color: Colors.green, size: 22),
            suffixStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white70)),
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.green[600],
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        keyboardType:
        TextInputType.numberWithOptions(signed: false, decimal: true),
        autofocus: false,
        autocorrect: false,
      ));
}

Widget bottomTextField() {
  return new IntrinsicWidth(
      stepHeight: 20,
      stepWidth: 5,
      child: TextField(
        decoration: InputDecoration(
            suffixText: "%",
            suffixStyle: TextStyle(color: Colors.white, fontSize: 15),
            hintText: "15",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
        style: TextStyle(
          fontSize: 20.0, // height: 2.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        keyboardType:
        TextInputType.numberWithOptions(signed: false, decimal: true),
        autofocus: false,
        autocorrect: false,
      ));
}


SnackBar snackBar() {
  return SnackBar(
      duration: Duration(days: 1),
      content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            bottomTextField(),
            tipBottom(),
            totalBottom(),
          ]
      )
  );
}