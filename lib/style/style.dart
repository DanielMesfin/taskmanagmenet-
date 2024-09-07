import 'package:flutter/material.dart';

class Styles {
  static const largeBoldText = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w900,
  );

  static const labelBoldBlackText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const buttonGrdient = LinearGradient(colors: <Color>[
    Color(0xff06186d),
    Color(0xff1d3aa3),
    Color(0xff203faa),
  ], tileMode: TileMode.mirror);

  static const blueContainerGrdient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: <Color>[
        Color(0xff06186d),
        Color(0xff4066d2),
        Color(0xff203faa),
      ],
      tileMode: TileMode.mirror);

  static const yellowishGrdient = LinearGradient(colors: <Color>[
    Color(0xffe8182e),
    Color(0xfff55460),
  ], tileMode: TileMode.mirror);

  static const blueGrdient = LinearGradient(colors: <Color>[
    Color(0xff1266e7),
    Color(0xff1f81e8),
    Color(0xff1266e7),
  ], tileMode: TileMode.mirror);

  static const defaultButtonGrdient = LinearGradient(
    colors: <Color>[
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
    ],
    tileMode: TileMode.mirror,
  );

  static const appGrdient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffcce0d8),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffffffff),
      Color(0xffcec2c2),
    ],
    tileMode: TileMode.mirror,
  );

  static const blueWhiteBlueGrdient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: <Color>[
      Color(0xff072079),
      Color(0xff405ae2),
      Color(0xff405ae2),
      Color(0xff1e33ce),
    ],
    tileMode: TileMode.mirror,
  );

  static const kBgColor = LinearGradient(
    colors: [
      Colors.indigo,
      Colors.red,
    ],
  );

  static const applicationThem = Color(0xFF1E1D33);
  static const inactiveColor = Color(0xFF1E1D33);
  static const activeColor = Color(0xFF1E1E65);
  static const cardColor = Colors.grey;

  // static final kInputDecoration = InputDecoration(
  //   filled: true,
  //   fillColor: const Color(0xfff5f1f0),
  //   isCollapsed: true,
  //   icon: null,
  //   hintText: 'Enter the value',
  //   hintStyle: const TextStyle(
  //     fontSize: 18,
  //     color: Colors.black87,
  //   ),
  //   contentPadding: EdgeInsets.symmetric(
  //     vertical: GetSize.getScreenHeightDevice(5),
  //     horizontal: GetSize.getScreenWidthDevice(15),
  //   ),
  //   border: const OutlineInputBorder(
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(5.0),
  //     ),
  //   ),
  //   enabledBorder: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(5.0),
  //     ),
  //   ),
  //   focusedBorder: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(5.0),
  //     ),
  //   ),

  // );

  static const titleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );
  static const taskDescriptionStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
    height: 1.5,
    overflow: TextOverflow.ellipsis,
  );
  static const completedTaskStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    // color: Colors.grey,
    decoration: TextDecoration.lineThrough,
    height: 1.5,
    overflow: TextOverflow.ellipsis,
  );
  static const incompleteTaskStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    // color: Colors.black,
    height: 1.5,
    overflow: TextOverflow.ellipsis,
  );
}
