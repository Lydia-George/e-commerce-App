import 'package:flutter/material.dart';

import '../../../../features/shop/models/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/category_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// Title , Price , & Size
        Expanded(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TCategoryTitleWithVertifiedIcon(
                  title: cartItem.brandName ?? '',
                ),
                Flexible(
                    child: TProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                )),

                /// Attributes
                Text.rich(TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries
                        .map((e) => TextSpan(children: [
                              TextSpan(
                                  text: '${e.key}',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: '${e.value}',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ]))
                        .toList()
                    // TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                    // TextSpan(text: "Yellow",style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor)),
                    // TextSpan(text: " Size ",style: Theme.of(context).textTheme.bodySmall),
                    // TextSpan(text: "100 gm",style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor)),

                    ))
              ]),
        ),
      ],
    );
  }
}
