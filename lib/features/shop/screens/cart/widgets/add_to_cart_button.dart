import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_app/utlis/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // if the product have variations then show the product Details for variation selection.
        // Else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color:
                productQuantityInCart > 0 ? TColors.primaryColor : TColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
              width: TSizes.iconLg * 1.2,
              height: TSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(
                          productQuantityInCart.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColors.white),
                        )
                      : const Icon(
                          Iconsax.add,
                          color: TColors.white,
                        ))),
        );
      }),
    );
  }
}
