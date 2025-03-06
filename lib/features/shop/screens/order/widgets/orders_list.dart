import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TOrdersListItems extends StatelessWidget {
  const TOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrder(),
        builder: (_, snapshot) {
          ///Nothing Found Widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet',
            animation: TImages.orderCompleteAnimation,
            showAction: true,
            actionText: 'Let\'s fill it ',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          // Helper Function : Handle Loader , No Record , OR ERROR Message
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          // Congratulation ! Record Found .
          final orders = snapshot.data!;
          return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, __) =>
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              itemCount: orders.length,
              itemBuilder: (_, index) {
                final order = orders[index];
                return TCircularContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSizes.md),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [

                            /// 1- Icon
                            Icon(
                              Iconsax.ship,
                              color: dark
                                  ? TColors.secondaryColor
                                  : TColors.primaryColor,
                            ),
                            const SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),

                            /// 2- Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.orderStatusText,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                        color: dark
                                            ? TColors.secondaryColor
                                            : TColors.primaryColor,
                                        fontWeightDelta: 1),
                                  ),
                                  Text(
                                    order.formattedOrderDate,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .apply(color: TColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),

                            /// 3- Icon
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconsax.arrow_right_34,
                                  size: TSizes.iconSm,
                                  color: dark
                                      ? TColors.secondaryColor
                                      : TColors.primaryColor,
                                ))
                          ],
                        ),

                        /// Row 2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [

                                  /// 1- Icon
                                  Icon(
                                    Iconsax.tag,
                                    color: dark
                                        ? TColors.secondaryColor
                                        : TColors.primaryColor,
                                  ),
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),

                                  /// 2- Status & Date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Order",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .labelMedium!
                                              .apply(
                                              color: dark
                                                  ? TColors.secondaryColor
                                                  : Colors.grey,
                                              fontWeightDelta: 1),
                                        ),
                                        Text(
                                          order.id,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleMedium!
                                              .apply(
                                              color:
                                              TColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [

                                  /// 1- Icon
                                  Icon(
                                    Iconsax.calendar,
                                    color: dark
                                        ? TColors.secondaryColor
                                        : TColors.primaryColor,
                                  ),
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems / 2,
                                  ),

                                  /// 2- Status & Date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Shipping Date",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .labelMedium!
                                              .apply(
                                              color: dark
                                                  ? TColors.secondaryColor
                                                  : Colors.grey,
                                              fontWeightDelta: 1),
                                        ),
                                        Text(
                                          order.formattedDeliveryDate,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleMedium!
                                              .apply(
                                              color:
                                              TColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
              });
        });
  }
}
