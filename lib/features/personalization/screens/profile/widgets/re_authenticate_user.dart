import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/constants/text_strings.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:ecommerce_app/utlis/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Re-Authenticate User',
          style: TextStyle(
              color: dark ? TColors.secondaryColor : TColors.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.direct_right),
                        labelText: TText.email,
                        labelStyle: TextStyle(
                            color: dark
                                ? TColors.secondaryColor.withOpacity(0.5)
                                : TColors.primaryColor.withOpacity(0.5)),
                        floatingLabelStyle: TextStyle(
                            color: dark
                                ? TColors.secondaryColor
                                : TColors.primaryColor)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),

                  /// Password
                  Obx(() => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            TValidator.validateEmptyText('Password', value),
                        decoration: InputDecoration(
                            labelText: TText.password,
                            labelStyle: TextStyle(
                                color: dark
                                    ? TColors.secondaryColor.withOpacity(0.5)
                                    : TColors.primaryColor.withOpacity(0.5)),
                            prefixIcon: const Icon(Iconsax.password_check),
                            floatingLabelStyle: TextStyle(
                                color: dark
                                    ? TColors.secondaryColor
                                    : TColors.primaryColor),
                            suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon:  Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye))),
                      )),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: dark
                                ? TColors.secondaryColor
                                : TColors.primaryColor,
                            side: BorderSide.none),
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: dark
                                  ? TColors.primaryColor
                                  : TColors.secondaryColor),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
