import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';


class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
     this.smallSize= false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
   final dark = THelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: smallSize ? Theme.of(context).textTheme.labelLarge!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor) : Theme.of(context).textTheme.titleSmall!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
