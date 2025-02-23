import 'package:ecommerce_app/common/widgets/categories/category_show_case.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utlis/constants/image_strings.dart';
class CategorySubtitle extends StatelessWidget {
  const CategorySubtitle({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return TCategoryShowCase(
      dark: dark,
      images: const [
        TImages.oatmealSoap,
        TImages.unicornSoap,
        TImages.ironmaSoap
      ],
    );
  }
}
