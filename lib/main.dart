import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/tabs.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

// one  coloScheme // second  textTheme and color

void main() {
  runApp(
    const Add(),
  );
}

class Add extends StatelessWidget {
  const Add({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
