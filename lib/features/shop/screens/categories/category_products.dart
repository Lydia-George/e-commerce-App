import 'package:ecommerce_app/common/widgets/categories/category_card.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text("Kids Soap" , style: TextStyle(color: isDark ? TColors.secondaryColor : TColors.primaryColor ),),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Category Detail
                TCategoryCard(showBorder: true),
                SizedBox(height: TSizes.spaceBtwSections,),

                TSortableProducts(products: [],),

              ],
            ),
          ),
        ));
  }
}
