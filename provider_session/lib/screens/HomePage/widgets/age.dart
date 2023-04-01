import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_session/constants.dart';
import 'package:provider_session/screens/HomePage/logic/provider.dart';

import '../../../components/reusable_card.dart';
import '../../../components/round_icon_button.dart';

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorProvider ageProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    int age = context.select(
      (CalculatorProvider provider) => provider.age,
    );
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'AGE',
              style: kLabelTextStyle,
            ),
            Text(
              age.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: Icons.minimize,
                  onPressed: () {
                    ageProvider.dcrementAge();
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      ageProvider.incrementAge();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
