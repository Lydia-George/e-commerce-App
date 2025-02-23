import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utlis/helpers/network_manager.dart';
import 'package:ecommerce_app/utlis/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utlis/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utlis/constants/image_strings.dart';

class LoginController extends GetxController {
  /// Variables
  /// .obs:This makes the variable "observable."
  /// In GetX,making something observable allows the UI to react automatically whenever the value changes.
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  /// creating a way to save information on the device (like remembering the user's preferences).
  /// The localStorage variable is used to store and retrieve this data later.
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  ///creating a special ID called loginFormKey that lets you control and manage a form in Flutter.
  /// You can use this ID to check if the form is filled out correctly, save it, or reset it.
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();


  }

  /// --- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // If the form is invalid, stop loading and return
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap' , message: e.toString());
    }
  }

  /// --- Google SignIn Authentication
  Future<void> googleSignIn() async{
    try{
      // Start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =  await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // once record is stored we want to remove the loader
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap' , message: e.toString());
    }
  }
}
