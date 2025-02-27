import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();
  /// -- variables
  RxString selectedProductImage = ''.obs;

  /// -- Get All Images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    // Set String is to add Unique Images only , so this set isn't going to add duplicated image URLs ,
    // if you have same URL once or twice or thrice you're going to add the same URL,
    // it's not going to add that but it is going to add only once instead of duplicating ,
    // so if you have same img uploaded with different URLs so it is not going to work over here because that URL will not be treated as the unique
    //- Use Set to add unique images only
    Set<String> images = {};

    // so the first thing is to add inside this images add the product thumbnail image
    //- Load thumbnail image
    images.add(product.thumbnail);

    // and once we have this image then we can easily make this product thumbnail image assigned to
    // the selected product image because we 1st want to display the img as a large img
    //- Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    //- Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the product Variations if not null
    if (product.productVariations != null) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: TSizes.defaultSpace * 2,
                      horizontal: TSizes.defaultSpace,
                    ),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
