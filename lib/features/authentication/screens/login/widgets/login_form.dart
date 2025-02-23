import 'package:ecommerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:ecommerce_app/utlis/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Get.put() : to create a new instance and put that in the memory
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              cursorColor: dark ? TColors.secondaryColor : TColors.primaryColor,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: TText.email,
                labelStyle: TextStyle(
                    color:
                        dark ? TColors.secondaryColor : TColors.primaryColor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                floatingLabelStyle: TextStyle(
                    color:
                        dark ? TColors.secondaryColor : TColors.primaryColor),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Password
            /// Obx widget : is going to observe the values of hide password field ,
            /// redraw the TxtFormField only
            Obx(() => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  cursorColor:
                      dark ? TColors.secondaryColor : TColors.primaryColor,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.password,
                    labelStyle: TextStyle(
                        color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: dark
                                ? TColors.secondaryColor
                                : TColors.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: dark
                                ? TColors.secondaryColor
                                : TColors.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                    floatingLabelStyle: TextStyle(
                        color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                  ),
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Checkbox(
                        side: BorderSide(color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                          activeColor: dark
                              ? TColors.secondaryColor
                              : TColors.primaryColor,
                          checkColor: dark
                              ? TColors.primaryColor
                              : TColors.secondaryColor,
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                     const Text(
                      TText.rememberMe,
                      style: TextStyle(
                          color: TColors.primaryColor),
                    ),
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: Text(
                      TText.forgetPassword,
                      style: TextStyle(
                          color: dark
                              ? TColors.secondaryColor
                              : TColors.primaryColor),
                    )),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primaryColor,
                      side: const BorderSide(color: Colors.transparent)),
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(
                    TText.signIn,
                    style: TextStyle(color: TColors.secondaryColor),
                  )),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: dark
                              ? TColors.secondaryColor
                              : TColors.primaryColor)),
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: Text(
                    TText.createAccount,
                    style: TextStyle(
                        color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
