import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_session/screens/HomePage/logic/provider.dart';
import '../../../components/reusable_card.dart';
import '../../../components/round_icon_button.dart';
import '../../../constants.dart';

class Weight extends StatelessWidget {
  const Weight({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorProvider weightProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    int weight =
        context.select((CalculatorProvider provider) => provider.weight);
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'WEIGHT',
              style: kLabelTextStyle,
            ),
            Text(
              weight.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                    icon: Icons.minimize,
                    onPressed: () {
                      weightProvider.dcrementWeight();
                    }),
                const SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: Icons.add,
                  onPressed: () {
                    weightProvider.incrementWeight();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
