import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/category_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utlis/constants/enums.dart';
import 'package:ecommerce_app/utlis/constants/image_strings.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
    controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.lightContainer),
      child: Row(
        children: [
          /// Thumbnail
          TCircularContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                 SizedBox(
                  height: 120,
                    width: 120,
                    child: TRoundedImage(
                  imageUrl: product.thumbnail,
                  applyImageRadius: true,
                      isNetworkImage: true,
                )),


                /// -- Sale Tag
                if(salePercentage != null)
                Positioned(
                  top: 12,
                  child: TCircularContainer(
                    radius: TSizes.sm,
                    backgroundColor: Colors.yellow.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.sm),
                    child: Text(
                      salePercentage,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button
                 Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id,)
                )

              ],
            ),
          ),

          /// Details , Add To Cart & Pricing
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm , left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title,smallSize: true,),
                      const SizedBox(height: TSizes.spaceBtwItems /2,),
                       TCategoryTitleWithVertifiedIcon(title: product.brand!.name),

                    ],
                  ),
                  const Spacer(),

                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// Price
                       Flexible(
                          child: Column(
                            children: [
                              if (product.productType == ProductType.single.toString() && product.salePrice >0)
                                Padding(padding: EdgeInsets.only(left: TSizes.sm),
                                child:  Text(product.price.toString(),
                                style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),

                                ),
                                ),

                              /// Price , Show Sale Price as Main Price if sale Exist'
                              Padding(padding: EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(price: controller.getProductPrice(product)),
                              ),

                            ],
                          ) ),

                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),

                          ),

                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white,))),
                      )
                    ],
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
