import 'package:ecommerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                CupertinoIcons.clear,
                color: isDark ? TColors.secondaryColor : TColors.primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Email, Title & Subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color:
                        isDark ? TColors.secondaryColor : TColors.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TText.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color:
                        isDark ? TColors.secondaryColor : TColors.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(
                TText.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: isDark
                    ? TColors.secondaryColor.withOpacity(0.5)
                    : TColors.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? TColors.secondaryColor
                        : TColors.primaryColor,
                    side: BorderSide.none
                  ),
                    onPressed: () => Get.offAll(const LoginScreen()),
                    child:  Text(TText.done, style: TextStyle(color: isDark
                        ?TColors.primaryColor
                        :TColors.secondaryColor ),)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child:  const Text(TText.resendEmail , style: TextStyle(color: TColors.primaryColor),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
