import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText(
      {super.key,
       this.currencySign = "L.E",
      required this.price,
        this.maxLines = 1,
       this.isLarge = false,
       this.lineThrough = false});

  final String currencySign, price;

  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Text(
        price  + currencySign ,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
        ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null,color: dark? TColors.secondaryColor : TColors.primaryColor)
          : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough: null, color: dark? TColors.secondaryColor : TColors.primaryColor)
    );
  }
}
