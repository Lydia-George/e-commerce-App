import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.darkGrey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.minus,
                  color: TColors.primaryColor,
                  backgroundColor: TColors.secondaryColor,
                  width: 40,
                  height: 40,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: TColors.secondaryColor),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.primaryColor,
                  width: 40,
                  height: 40,
                  color: TColors.secondaryColor,
                  onPressed: () => controller.productQuantityInCart += 1,
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(TSizes.md),
                    backgroundColor: TColors.primaryColor,
                    side: const BorderSide(
                      color: Colors.transparent,
                    )),
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () => controller.addToCart(product),
                child: const Row(
                  children: [
                    Icon(
                      Iconsax.shopping_cart,
                      color: TColors.secondaryColor,
                    ),
                    SizedBox(
                      width: TSizes.spaceBtwItems / 2,
                    ),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: TColors.secondaryColor,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
