import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';
import '../images/circular_image.dart';
class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0,),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.secondaryColor)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.secondaryColor),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.secondaryColor,)),
    );
  }
}