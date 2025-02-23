import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/screens/categories/all_categories.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';

import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/categories/category_card.dart';
import '../../../../common/widgets/custom_appbar/tabbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: TextStyle(
                color: isDark ? TColors.secondaryColor : TColors.primaryColor),
          ),
          actions: [
            TCartCounterIcon(
              iconColor: isDark ? TColors.secondaryColor : TColors.primaryColor,
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// -- Search bar
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          text: "Search in Store",
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// -- Popular Categories
                        TSectionHeading(
                          title: "Popular Categories",
                          textColor: isDark
                              ? TColors.secondaryColor
                              : TColors.primaryColor,
                          onPressed: () => Get.to(() => const AllCategories()),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 55,
                            itemBuilder: (_, index) {
                              return const TCategoryCard(
                                showBorder: true,
                              );
                            })
                      ],
                    ),
                  ),

                  /// Tabs
                  bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()),
                ),
              ];
            },

            /// Body
            body:  TabBarView(
                children:
                categories.map((category) => TCategoryTab(category: category )).toList()
            )),
      ),
    );
  }
}
