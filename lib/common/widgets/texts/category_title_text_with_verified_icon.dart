import 'package:ecommerce_app/common/widgets/texts/category_title_text.dart';
import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/enums.dart';

class TCategoryTitleWithVertifiedIcon extends StatelessWidget {
  const TCategoryTitleWithVertifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.categoryTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes categoryTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TCategoryTitleText(
                title: title,
              color: textColor,
              maxLines: maxLines,
              textAlign: textAlign,
              categoryTextSize: categoryTextSize ,

            ),
        ),
        // const SizedBox(
        //   width: TSizes.xs,
        // ),
        // const Icon(
        //   Iconsax.verify5,
        //   color: TColors.primaryColor,
        //   size: TSizes.iconXs,
        // )
      ],
    );
  }
}
