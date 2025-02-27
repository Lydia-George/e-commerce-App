import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';
class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController();
    return Row(
      children: [
        SizedBox(
          width: 5,
          height: 5,

          child:
              Obx( () => Checkbox(
                activeColor: dark ? TColors.secondaryColor : TColors.primaryColor,
                checkColor: dark ? TColors.primaryColor : TColors.secondaryColor,
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
              ) ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TText.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),

          TextSpan(
              text: TText.privacyPolicy,
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.secondaryColor : TColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.secondaryColor : TColors.primaryColor,
              )),

          TextSpan(
              text: ' ${TText.and} ',
              style: Theme.of(context).textTheme.bodySmall),

          TextSpan(
              text: '${TText.termsOfUse} ',
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.secondaryColor : TColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.secondaryColor : TColors.primaryColor,

              )),

        ])),
      ],
    );
  }
}