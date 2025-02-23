import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class for managing a full-screen loading dialog .
class TFullScreenLoader {
  /// open a full-screen loading dialog with a given text and animation .
  /// This static method doesn't return anything  , receives text & animation.
  ///
  /// parameters :
  ///  - text : The Text to be displayed in the loading dialog
  ///  - animation : The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
        barrierDismissible: false, // The Dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,), // Adjust the space as needed
                  TAnimationLoaderWidget(text: text, animation: animation, )

                ],
              ),
            )));
  }
  /// Stop  the currently open Loading dialog.
/// This Method doesn't return anything .
static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using the navigator
}
}
