import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';


class TTabBar extends StatelessWidget implements PreferredSizeWidget{

  /// If you want to add the background color to tabs you have to wrap them in material Widget
  /// to do that we need [PrefferedSized ] Widget and that's why created custom class [PrefferedSizedWidget]

  const TTabBar({super.key , required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark? TColors.black :TColors.white,
      child: TabBar(

        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primaryColor,
        unselectedLabelColor: TColors.inputField,
        labelColor: THelperFunctions.isDarkMode(context) ? TColors.secondaryColor : TColors.primaryColor,
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtlis.getAppBarHeight());

}