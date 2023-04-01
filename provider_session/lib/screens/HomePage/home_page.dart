import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_session/screens/HomePage/widgets/age.dart';
import 'package:provider_session/screens/HomePage/widgets/genderselector.dart';
import 'package:provider_session/screens/HomePage/widgets/hight_slider.dart';
import 'package:provider_session/screens/HomePage/widgets/weight.dart';

import 'logic/provider.dart';
import '../../components/bottom_button.dart';
import '../../components/icon_content.dart';
import '../../components/reusable_card.dart';
import '../../components/round_icon_button.dart';
import '../../constants.dart';
import '../ResultPage/results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // CalculatorProvider provider=Provider.of<CalculatorProvider>(get context, listen: false);
  //int weight = provider.weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //GenderSelector
          GenderSelector(),
          //HeightSelector
          HightSlider(),

          //Weight and Age
          Expanded(
            child: Row(
              children: <Widget>[
                Weight(),
                Age(),
              ],
            ),
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorProvider calc = CalculatorProvider();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(
                        height: (calc.height).toInt(), weight: calc.weight),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
