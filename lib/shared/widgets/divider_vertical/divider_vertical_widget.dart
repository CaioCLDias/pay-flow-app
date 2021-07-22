import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class DividerVerticalWiget extends StatelessWidget {
  const DividerVerticalWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }
}
