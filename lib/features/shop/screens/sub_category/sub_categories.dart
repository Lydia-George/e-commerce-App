import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/helpers/cloud_helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineMedium!.apply(
              color: dark ? TColors.secondaryColor : TColors.primaryColor),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner4,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  /// Handle Loader , No Record , Or Error Message
                  const loader = THorizontalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  /// Record found.
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot){

                            /// Handle Loader , No Record , Or Error Message
                            const loader = THorizontalProductShimmer();
                            final widget = TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                            );
                            if (widget != null) return widget;

                            /// Congratulations! Record Found.
                            final products = snapshot.data!;


                            return Column(
                              children: [
                                /// Heading
                                TSectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(() => AllProducts(
                                    title: subCategory.name,
                                    futureMethod:
                                    controller.getCategoryProducts(
                                        categoryId: subCategory.id,
                                        limit: -1),
                                  )),
                                  textColor: dark
                                      ? TColors.secondaryColor
                                      : TColors.primaryColor,
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems / 2,
                                ),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: TSizes.spaceBtwItems,
                                      ),
                                      itemBuilder: (context, index) =>
                                       TProductCardHorizontal(product: products[index])),
                                ),
                                const SizedBox(height: TSizes.spaceBtwSections,),
                              ],
                            );
                          },

                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
