import 'package:flutter/material.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(
  colors: [
    Color.fromRGBO(236, 60, 3, 1),
    Color.fromRGBO(234, 60, 3, 1),
    Color.fromRGBO(216, 78, 16, 1),
  ],
  begin: FractionalOffset.topCenter,
  end: FractionalOffset.bottomCenter,
);

// separating comma prices
String commaSeparatedPrice(String price) {
  String finalPrice = "";
  int position = 0;
  for (int i = price.length; i > 1; i--) {
    position++;
    finalPrice = price.substring(
      price.length - position,
      (price.length - position + 1),
    ) +
        finalPrice;
    if (position % 3 == 0) {
      finalPrice = ",$finalPrice";
    }
  }
  return price.substring(0,1)+finalPrice;
}

