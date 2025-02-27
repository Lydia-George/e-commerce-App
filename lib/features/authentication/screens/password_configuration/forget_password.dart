import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/validators/validation.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(TText.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: isDark
                        ? TColors.secondaryColor
                        : TColors.primaryColor)),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(TText.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                keyboardType: TextInputType.emailAddress,
                cursorColor:
                    isDark ? TColors.secondaryColor : TColors.primaryColor,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isDark
                                ? TColors.secondaryColor
                                : TColors.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isDark
                                ? TColors.secondaryColor
                                : TColors.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    labelText: TText.email,
                    labelStyle: TextStyle(
                        color: isDark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                    floatingLabelStyle: TextStyle(
                      color: isDark
                          ? TColors.secondaryColor
                          : TColors.primaryColor
                    ),
                    prefixIcon:  Icon(Iconsax.direct_right,color: isDark
                        ? TColors.secondaryColor
                        : TColors.primaryColor,)),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark
                          ? TColors.secondaryColor
                          : TColors.primaryColor,
                      side: BorderSide.none,
                    ),
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: Text(
                      TText.submit,
                      style: TextStyle(
                          color: isDark
                              ? TColors.primaryColor
                              : TColors.secondaryColor),
                    )))
          ],
        ),
      ),
    );
  }
}
