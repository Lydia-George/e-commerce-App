import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

import '../../icons/circular_icon.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
         TCircularIcon(
          icon: Iconsax.minus,
          color: TColors.primaryColor,
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundColor: THelperFunctions.isDarkMode(context)? TColors.primaryColor: TColors.secondaryColor,
          onPressed: remove,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall!.apply(
              color: dark ? TColors.secondaryColor : TColors.primaryColor),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
         TCircularIcon(
          icon: Iconsax.add,
          color: TColors.secondaryColor,
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundColor: TColors.primaryColor,
          onPressed: add,
        ),
      ],
    );
  }
}
