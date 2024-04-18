import 'package:flutter/material.dart';
import 'package:bmi_calculator/InputPage.dart';


void main() {
  runApp(BmiCal());
}
class BmiCal extends StatelessWidget {
  const BmiCal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
    home:InputPage(),
    );
  }
}


