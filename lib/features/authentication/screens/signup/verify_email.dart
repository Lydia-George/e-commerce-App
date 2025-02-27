import 'package:ecommerce_app/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put( VerifyEmailController());

    return Scaffold(
      /// The close icon in the app bar is used to log out the user and redirect them to the login screen.

      /// This approach is taken to handle scenarios where the user enters the registration process ,
      /// and the data is stored.Upon reopening the app , it checks if the email is verified .
      /// If not verified , the app always navigates to the verification screen .

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(
                CupertinoIcons.clear,
                color: dark ? TColors.secondaryColor : TColors.primaryColor,
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

              /// Title & Subtitle
              Text(
                TText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color:
                        dark ? TColors.secondaryColor : TColors.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    color:
                        dark ? TColors.secondaryColor : TColors.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: dark
                        ? TColors.secondaryColor.withOpacity(0.5)
                        : TColors.primaryColor.withOpacity(0.5)),
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
                        backgroundColor: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor,
                    side: BorderSide.none
                    ),
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: Text(
                      TText.tContinue,
                      style: TextStyle(
                          color: dark
                              ? TColors.primaryColor
                              : TColors.secondaryColor),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text(
                      TText.resendEmail,
                      style: TextStyle(
                          color: dark
                              ? TColors.secondaryColor
                              : TColors.primaryColor),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
