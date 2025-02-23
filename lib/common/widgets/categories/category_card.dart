import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';
import '../../../utlis/constants/sizes.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../images/circular_image.dart';
import '../texts/category_title_text_with_verified_icon.dart';

class TCategoryCard extends StatelessWidget {
  const TCategoryCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });


  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: TCircularContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        radius: 120,
        child: Row(
          children: [
            /// Icon
            const Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImages.cosmeticsIcon,
                backgroundColor: Colors.transparent,
                // overlayColor: THelperFunctions.isDarkMode(context) ? TColors.secondaryColor : TColors.primaryColor,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),

            /// Texts
            /// [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and also
            /// to keep text inside the boundaries

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TCategoryTitleWithVertifiedIcon(
                    title: "Cosmetics",
                    textColor:
                        isDark ? TColors.secondaryColor : TColors.primaryColor,
                    // categoryTextSize: TextSizes.large,
                  ),
                  // Text("25 Products",
                  //   overflow: TextOverflow.ellipsis,
                  //   style: Theme.of(context).textTheme.labelMedium,
                  //
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
