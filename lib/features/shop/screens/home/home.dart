import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// -- Appbar
                const THomeAppBar(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// -- Searchbar
                const TSearchContainer(
                  text: 'Search in Store',
                  icon: Iconsax.search_normal,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// -- Categories
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// --Heading
                      TSectionHeading(
                        title: 'Popular Categories',
                        onPressed: () {},
                        showActionButton: false,
                        textColor: TColors.secondaryColor,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// -- Categories
                      const THomeCategories()
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /////// -- Heading
                  TSectionHeading(
                      title: 'Popular Products',
                      textColor: isDark
                          ? TColors.secondaryColor
                          : TColors.primaryColor,
                      onPressed: () => Get.to(() =>  AllProducts(title: 'Popular Products',
                      query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ))),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products

                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No Data Found!' , style: Theme.of(context).textTheme.bodyMedium,),);
                    }

                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) =>  TProductCardVertical(product:  controller.featuredProducts[index]),
                    );

                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
