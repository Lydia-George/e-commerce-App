import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/product/favourites_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';
import '../../../../utils/helpers/helper_functions.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            'Wishlist',
            style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: dark ? TColors.secondaryColor : TColors.primaryColor),
          ),
          actions: [
            TCircularIcon(
                icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          /// Products Grid
          child: Obx(
              () => FutureBuilder(
                future: controller.favouriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Ooooops! WhishList is Empty...',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: 'Let\' s add Some',
                    onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );

                  const loader = TVerticalProductShimmer(
                    itemCount: 6,
                  );
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          TProductCardVertical(product: products[index]));
                }),
          ),
        )));
  }
}
