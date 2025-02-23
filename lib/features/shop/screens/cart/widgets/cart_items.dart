import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utlis/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,
     this.showAddRemoveButtons= true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, __) => Column(
        children: [
          const TCartItem(),

            if (showAddRemoveButtons) const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          if (showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  SizedBox(
                    width: 70,
                  ),

                  /// Add Remove Buttons
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: " 125 ")
            ],
          )
        ],
      ),
    );
  }
}
