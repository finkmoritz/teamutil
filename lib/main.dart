import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teamutil/pages/home_page.dart';
import 'package:teamutil/providers/estimation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EstimationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Estimation Tinder',
        theme: ThemeData(
          textTheme: GoogleFonts.pacificoTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.pink,
        ),
        home: const HomePage(),
      ),
    );
  }
}
