import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color:
                            dark ? TColors.secondaryColor : TColors.primaryColor,
                      ),
                    ),
                  );
                })),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 20,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor: dark ? TColors.dark : TColors.light,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(TSizes.sm),
                      onPressed: () => controller.selectedProductImage.value == images[index],
                      border: Border.all(
                          color: imageSelected
                              ? TColors.primaryColor
                              : Colors.transparent),
                    );
                  }),
                ),
              ),
            ),

            /// Appbar Icons
             TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: product.id,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
