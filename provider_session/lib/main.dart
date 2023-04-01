import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_session/screens/HomePage/logic/provider.dart';

import 'screens/HomePage/home_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return CalculatorProvider();
        },
        child: InputPage(),
      ),
    );
  }
}
