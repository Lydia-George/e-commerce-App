import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/sizes.dart';
import '../../../utlis/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';
import 'category_card.dart';
class TCategoryShowCase extends StatelessWidget {
  const TCategoryShowCase({
    super.key,
    required this.dark,
    required this.images,
  });

  final bool dark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      showBorder: true,
      borderColor: dark ? TColors.secondaryColor :TColors.primaryColor,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Categories with products count
          const TCategoryCard( showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),

          /// Category Top Product Images
          Row(
            children: images.map((image) => categoryTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }
  Widget categoryTopProductImageWidget(String image, context){
    return Expanded(
      child: TCircularContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey: TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.contain,),
      ),
    );
  }
}