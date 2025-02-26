import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:ecommerce_app/utlis/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

import '../../../controllers/product/cart_controller.dart';
class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
            Text("$subTotal L.E",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
            Text("${TPricingCalculator.calculateShippingCost(subTotal, 'Egypt')} L.E",style: Theme.of(context).textTheme.labelLarge!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
            Text("${TPricingCalculator.calculateTax(subTotal, 'Egypt')} L.E",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
            Text("${TPricingCalculator.calculateTotalPrice(subTotal, 'Egypt')} L.E",style: Theme.of(context).textTheme.titleMedium!.apply(color: dark?  TColors.secondaryColor : TColors.primaryColor),),
          ],
        ),
      ],
    );
  }
}
