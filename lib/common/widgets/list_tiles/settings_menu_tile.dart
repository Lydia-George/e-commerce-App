import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
        this.onTap
      });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListTile(
      leading: Icon(icon, size: 28, color: dark ? TColors.secondaryColor : TColors.primaryColor,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: dark? TColors.secondaryColor: TColors.primaryColor),),
      subtitle: Text(subTitle,style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
