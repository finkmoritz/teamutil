import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamutil/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estimation Tinder',
      theme: ThemeData(
        textTheme: GoogleFonts.pacificoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}
