import 'package:flutter/material.dart';

var appBarColor = const Color(0xff172437);
var homePageBackgroundColor = const Color(0xffefefef);
var productBorderColor = const Color(0xffeeeeee);
var footerTextStyle = const TextStyle(color: Colors.white, fontSize: 12);

var kBrandNameTextStyle = const TextStyle(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

var kActualPriceTextStyle = const TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const kMrpTextStyle = TextStyle(
  color: Colors.black38,
  decoration: TextDecoration.lineThrough,
  fontSize: 16,
);
const kDiscountTextStyle = TextStyle(
  color: Colors.green,
  fontSize: 15,
);

const kDescriptionTextStyle = TextStyle(
  color: Colors.black54,
);

const authority = "city-super-market.up.railway.app";

var kIconBrandNameTextStyle = const TextStyle(
  color: Colors.black87,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

var kIconActualPriceTextStyle = const TextStyle(
  fontSize: 18,
  color: Colors.green,
);

const kIconMrpTextStyle = TextStyle(
  color: Colors.black38,
  decoration: TextDecoration.lineThrough,
  fontSize: 16,
);
const kIconDiscountTextStyle =
    TextStyle(color: Colors.black38, decoration: TextDecoration.lineThrough);

const kIconDescriptionTextStyle = TextStyle(
  color: Colors.black54,
);

const kLoginTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

var kCartEmptyTextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 35,
);

var kCartEmptyMsgTextStyle = const TextStyle(
  color: Colors.black54,
);

var kCustomTextField = const TextField(
    style: TextStyle(fontSize: 15),
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        border: OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.zero)),
        hintText: "",
        focusedBorder: OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.zero)),
        focusColor: Colors.black26));

var kCartMissingCartItemsMsgTextStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 25,
);

var kPriceDetialsTextStyle = const TextStyle(fontWeight: FontWeight.w500);

var kPriceDiscountTextStyle =
    const TextStyle(fontWeight: FontWeight.w500, color: Colors.green);

var kQuantityTextStyle = const TextStyle(
  color: Colors.white,
);

var kQuantityButtonStyle = TextButton.styleFrom(
    side: BorderSide(color: appBarColor),
    foregroundColor: appBarColor,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));

var kQuantitySelectedButtonStyle = TextButton.styleFrom(
  backgroundColor: appBarColor,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
);
