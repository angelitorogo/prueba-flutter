

import 'package:flutter/material.dart';

class AppTheme {


  ThemeData getTheme() {

    const seedColor = Color.fromARGB(255, 255, 255, 255);

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,  //color de texto de por ejemplo, lo botones
      brightness: Brightness.dark,
    );

  }

}