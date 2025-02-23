
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_subtitle.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/categories/category_show_case.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Categories

              CategorySubtitle(category: category),
              TCategoryShowCase(
                dark: dark,
                images: const [
                  TImages.oatmealSoap,
                  TImages.unicornSoap,
                  TImages.ironmaSoap
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Products
              TSectionHeading(title: "You might like", onPressed: (){},),
              const SizedBox(height: TSizes.spaceBtwItems,),

              TGridLayout(itemCount: 6, itemBuilder: (_, index)=>  TProductCardVertical(product: ProductModel.empty(),))

            ],
          ),
        ),
      ],
    );
  }
}
