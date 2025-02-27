import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class TOrdersListItems extends StatelessWidget {
  const TOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems,),
      itemCount: 10,
      itemBuilder: (_, index) => TCircularContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(

              children: [
                /// 1- Icon
                 Icon(Iconsax.ship,color: dark? TColors.secondaryColor : TColors.primaryColor,),
                const SizedBox(width: TSizes.spaceBtwItems/2,),

                /// 2- Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Proccessing",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark ? TColors.secondaryColor : TColors.primaryColor , fontWeightDelta: 1),
                      ),
                      Text("07 Feb 2024",
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.primaryColor),
                      ),

                    ],
                  ),
                ),

                /// 3- Icon
                IconButton(onPressed: (){}, icon:  Icon(Iconsax.arrow_right_34, size: TSizes.iconSm, color: dark? TColors.secondaryColor : TColors.primaryColor,))
              ],
            ),

            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(

                    children: [
                      /// 1- Icon
                      Icon(Iconsax.tag,color: dark? TColors.secondaryColor : TColors.primaryColor,),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),

                      /// 2- Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",
                              style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.secondaryColor : Colors.grey, fontWeightDelta: 1),
                            ),
                            Text("[#256f2]",
                              style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.primaryColor),
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
                      Icon(Iconsax.calendar,color: dark? TColors.secondaryColor : TColors.primaryColor,),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),

                      /// 2- Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.secondaryColor : Colors.grey , fontWeightDelta: 1),
                            ),
                            Text("17 Feb 2024",
                              style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.primaryColor),
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
      ),
    );
  }
}
