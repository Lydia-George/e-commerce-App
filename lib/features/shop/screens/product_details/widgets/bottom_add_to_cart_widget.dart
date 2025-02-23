import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace /2),
      decoration: BoxDecoration(
        color: dark? TColors.darkerGrey :TColors.darkGrey ,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        )
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(icon: Iconsax.minus,
              color: TColors.primaryColor,
              backgroundColor: TColors.secondaryColor,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text("2",style: Theme.of(context).textTheme.titleSmall!.apply(color:  TColors.secondaryColor ),),
              const SizedBox(width: TSizes.spaceBtwItems,),
              const TCircularIcon(icon: Iconsax.add,
              backgroundColor: TColors.primaryColor,
                width: 40,
                height: 40,
                color: TColors.secondaryColor,
              ),

            ],
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.primaryColor,
              side: const BorderSide(
                color: Colors.transparent,
              )
            ),
              onPressed: (){}, child: const Row(
                children: [
                  Icon(Iconsax.shopping_cart,color: TColors.secondaryColor,),
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  Text("Add to Cart",style: TextStyle(color: TColors.secondaryColor,),),
                ],
              ))
        ],
      ),
    );
  }
}
