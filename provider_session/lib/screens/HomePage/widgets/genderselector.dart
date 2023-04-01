  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:provider_session/constants.dart';
  import 'package:provider_session/screens/HomePage/logic/provider.dart';
  import '../../../components/icon_content.dart';
  import '../../../components/reusable_card.dart';

  class GenderSelector extends StatelessWidget {
    const GenderSelector({super.key});
  
    @override
    Widget build(BuildContext context) {
      CalculatorProvider provider =
          Provider.of<CalculatorProvider>(context, listen: false);
      String gender = context
          .select((CalculatorProvider provider) => provider.selectedGender);
      return Expanded(
          child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              onPress: () {
                provider.editGender("male");
              },
              colour: gender == "male"
                  ? kActiveCardColour
                  : kInactiveCardColour,
              cardChild: IconContent(
                icon: Icons.male,
                label: 'MALE',
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                provider.editGender("female");
              },
              colour: gender == 'female'
                  ? kActiveCardColour
                  : kInactiveCardColour,
              cardChild: IconContent(
                icon: Icons.female,
                label: 'FEMALE',
              ),
            ),
          ),
        ],
      ));
    }
  }
