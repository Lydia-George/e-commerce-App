import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../controllers/product/checkout_controller.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: "Payment Method",
          buttonTitle: "Change",
          onPressed: () => controller.selectPaymentMethod(context),
          textColor: dark ? TColors.secondaryColor : TColors.primaryColor,
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Obx(() => Row(
          children: [
            TCircularContainer(
              width: 60,
              height: 40,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain,),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor),),

          ],
        ))

      ],
    );
  }
}
