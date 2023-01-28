import 'package:flutter/material.dart';
import 'icons_data.dart';

class ReusableConatiner extends StatelessWidget {
  ReusableConatiner(this.colorr, this.genderName, this.dataIcon);

  final Color colorr;
  final String genderName;
  final IconData dataIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorr,
      ),
      child: MalefemaleIcon(genderName, dataIcon),
    );
  }
}
