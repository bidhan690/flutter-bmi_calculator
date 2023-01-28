// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'constants.dart';

class MalefemaleIcon extends StatelessWidget {
  MalefemaleIcon(this.iconText, this.iconName);
  final String iconText;
  final IconData iconName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          iconText,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.selectIcon, this.onPressed);

  IconData selectIcon;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Color(0xff4c4f5e),
        child: Icon(selectIcon),
      ),
    );
  }
}
