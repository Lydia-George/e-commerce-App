import 'package:ecommerce_app/features/shop/controllers/all_products_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/helpers/helper_functions.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- DropDown
        DropdownButtonFormField(
          style: TextStyle(
              color: isDark ? TColors.primaryColor : TColors.secondaryColor),
          borderRadius: BorderRadius.circular(30),
          focusColor: isDark ? TColors.secondaryColor : TColors.primaryColor,
          dropdownColor: isDark ? TColors.secondaryColor : TColors.primaryColor,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: isDark
                          ? TColors.secondaryColor
                          : TColors.primaryColor)),
              prefixIconColor:
                  isDark ? TColors.secondaryColor : TColors.primaryColor,
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: isDark
                          ? TColors.secondaryColor
                          : TColors.primaryColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: isDark
                          ? TColors.secondaryColor
                          : TColors.primaryColor)),
              prefixIcon: const Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: [
            'name ',
            ' Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// -- Products
        Obx(
          () => TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  TProductCardVertical(product: controller.products[index])),
        ),
      ],
    );
  }
}
