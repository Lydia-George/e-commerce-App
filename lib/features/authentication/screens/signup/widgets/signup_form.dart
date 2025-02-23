import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:ecommerce_app/utlis/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            /// First & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TText.firstName,
                      prefixIcon: const Icon(Iconsax.user),
                      labelStyle: TextStyle(
                          color: isDark
                              ? TColors.secondaryColor
                              : TColors.primaryColor),
                    ),
                  ),
                ),

                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),

                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText("Last Name", value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TText.lastName,
                      prefixIcon: const Icon(Iconsax.user),
                      labelStyle: TextStyle(
                          color: isDark
                              ? TColors.secondaryColor
                              : TColors.primaryColor),
                    ),
                  ),
                ),

                // TextFormField(),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///Username
            TextFormField(
              keyboardType: TextInputType.name,
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: InputDecoration(
                labelText: TText.username,
                labelStyle: TextStyle(
                    color:
                        isDark ? TColors.secondaryColor : TColors.primaryColor),
                prefixIcon: const Icon(Iconsax.user_edit),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Email

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: InputDecoration(
                labelText: TText.email,
                prefixIcon: const Icon(Iconsax.direct),
                labelStyle: TextStyle(
                    color:
                        isDark ? TColors.secondaryColor : TColors.primaryColor),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Phone Number
            TextFormField(

              keyboardType: TextInputType.phone,
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: InputDecoration(
                prefixText: '+20 ',
                labelText: TText.phoneNo,
                prefixIcon: const Icon(Iconsax.call),
                labelStyle: TextStyle(
                    color:
                        isDark ? TColors.secondaryColor : TColors.primaryColor),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
                    () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.password,
                    labelStyle: TextStyle(
                        color: isDark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon( controller.hidePassword.value ?  Iconsax.eye_slash : Iconsax.eye )),
                  ),
                )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Terms&Conditions checkBox
            const TTermsAndConditionCheckbox(),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Create Account Btn
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      side: WidgetStatePropertyAll(BorderSide.none),
                      backgroundColor:
                          WidgetStatePropertyAll(TColors.primaryColor)),
                  onPressed: () => controller.signup(),
                  child: const Text(
                    TText.createAccount,
                    style: TextStyle(color: TColors.secondaryColor),
                  )),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ));
  }
}
