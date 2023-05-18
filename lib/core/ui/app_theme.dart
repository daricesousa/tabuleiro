import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: 'GloriaHallelujah',
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
