import 'package:ecommerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';
import '../../../utlis/constants/sizes.dart';


class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: () => controller.googleSignIn(),
              icon: const Image(
                width: TSizes.md,
                height: TSizes.md,
                image: AssetImage(TImages.google),
              )),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){},
              icon: const Image(
                width: TSizes.md,
                height: TSizes.md,
                image: AssetImage(TImages.facebook),
              )),
        ),

      ],
    );
  }
}