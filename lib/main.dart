import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tortoise Device Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
