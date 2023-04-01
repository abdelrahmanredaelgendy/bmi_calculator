import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_session/components/reusable_card.dart';
import 'package:provider_session/constants.dart';
import 'package:provider_session/screens/HomePage/logic/provider.dart';

class HightSlider extends StatelessWidget {
  const HightSlider({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorProvider hight_provider =
        Provider.of<CalculatorProvider>(context, listen: false);
    double hight = context.select((CalculatorProvider provider) =>provider.height ,);

    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  hight_provider.height.round().toString(),
                  style: kNumberTextStyle,
                ),
                const Text(
                  'cm',
                  style: kLabelTextStyle,
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: const Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: const Color(0xFFEB1555),
                overlayColor: const Color(0x29EB1555),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                value: hight_provider.height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: (double newValue) {
                  hight_provider.editHight(newValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
