import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
class TLogingHeader extends StatelessWidget {
  const TLogingHeader({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(

          height: 145,

          image:
          AssetImage(

              dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        const SizedBox(
          height: TSizes.md,
        ),
        Text(
          TText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.secondaryColor : TColors.primaryColor),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? TColors.secondaryColor : TColors.primaryColor),
        ),
      ],
    );
  }
}