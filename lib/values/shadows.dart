/*
*  shadows.dart
*  OApp
*
*  Created by Yobo Zorle .
*  Copyright © 2018 Klynox. All rights reserved.
    */

import 'package:flutter/rendering.dart';


class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(41, 255, 255, 255),
    offset: Offset(0, 8),
    blurRadius: 25,
  );
  static const BoxShadow createBtnShadow = BoxShadow(
    color: Color.fromARGB(255, 1, 33, 20),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
}