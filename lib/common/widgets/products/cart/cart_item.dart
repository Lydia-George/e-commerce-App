import 'package:flutter/material.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/category_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: TImages.ironmaSoap,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,

        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Title , Price , & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TCategoryTitleWithVertifiedIcon(title: "Cosmetics" ,),
              const Flexible(child: TProductTitleText(title: "IronMan Soap ",maxLines: 1,)),

              /// Attributes
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Yellow",style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor)),
                    TextSpan(text: " Size ",style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "100 gm",style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor)),

                  ]
              ))
            ],
          ),
        )
      ],
    );
  }
}