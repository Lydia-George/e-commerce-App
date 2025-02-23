import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/personalization/models/user_model.dart';
import 'package:ecommerce_app/utlis/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../../../../utlis/helpers/network_manager.dart';
import '../../../../utlis/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs; // Observable for hiding / showing password
  final privacyPolicy = true.obs; // Observable for hiding / showing password
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for lastName input
  final username = TextEditingController(); // controller for username input
  final password = TextEditingController(); // controller for password input
  final firstName = TextEditingController(); // controller for first Name input
  final phoneNumber = TextEditingController(); // controller for phone Number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// -- Sign Up
  void signup() async {
    try {
      // start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', TImages.docerAnimation);

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account , you must have to read and accept the privacy policy & Terms of use ',
        );
        return;
      }

      // Register user in the firebase Authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save Authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created ! Verify email to continue.');

      // move to verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
