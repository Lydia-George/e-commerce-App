import 'package:ecommerce_app/common/widgets/categories/category_card.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/categories/category_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar:  TAppBar(
        title: Text("Categories" ,style: TextStyle(color: isDark ? TColors.secondaryColor : TColors.primaryColor),),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
               TSectionHeading(
                title: "Categories",
                textColor:  isDark ? TColors.secondaryColor : TColors.primaryColor,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// -- Categories
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TCategoryCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const CategoryProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
