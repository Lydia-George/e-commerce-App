import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/device/device_utility.dart';
import '../../../../../utlis/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';


class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtlis.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.transparent),
              shape: const CircleBorder(), backgroundColor:dark ? TColors.primaryColor : Colors.black
          ),
          child:const Icon(Iconsax.arrow_right_3) ,));
  }
}