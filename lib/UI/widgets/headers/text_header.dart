import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/typescale.dart';

import '../../../utils/colors.dart';

class TextHeader extends StatelessWidget {
  final String title;
  const TextHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: Typescale.createStyle(
          typescale: TypescaleValues.P1,
          color: ColorPalette.stone700
      ),
    );
  }
}
