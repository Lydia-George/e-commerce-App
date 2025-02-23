import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../icons/circular_icon.dart';
class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TCircularIcon(icon: Iconsax.minus,
          color: TColors.primaryColor,
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundColor: TColors.secondaryColor,
        ),

        const SizedBox(width: TSizes.spaceBtwItems,),

        Text("2",style: Theme.of(context).textTheme.titleSmall!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor),),

        const SizedBox(width: TSizes.spaceBtwItems,),
        const TCircularIcon(icon: Iconsax.add,
          color: TColors.secondaryColor,
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundColor: TColors.primaryColor,
        ),
      ],
    );
  }
}