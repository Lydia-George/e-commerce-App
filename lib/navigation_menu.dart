import 'package:ecommerce_app/features/personalization/screens/settings/settings_screen.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/features/shop/screens/store/store_screen.dart';
import 'package:ecommerce_app/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar:Obx(
        ()=> NavigationBar(
          height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value=index,
            backgroundColor: isDark? TColors.black : Colors.white,
            indicatorColor: isDark? TColors.secondaryColor.withOpacity(0.3): TColors.primaryColor.withOpacity(0.3),




            destinations:  [

          NavigationDestination(icon: Icon(Iconsax.home , color: isDark ? TColors.secondaryColor : TColors.primaryColor,), label: "Home"  , ),
          NavigationDestination(icon: Icon(Iconsax.shop , color: isDark ? TColors.secondaryColor : TColors.primaryColor,), label: "Store"),
          NavigationDestination(icon: Icon(Iconsax.heart ,color: isDark ? TColors.secondaryColor : TColors.primaryColor,), label: "WishList"),
          NavigationDestination(icon: Icon(Iconsax.user , color: isDark ? TColors.secondaryColor : TColors.primaryColor,), label: "Profile"),

        ]),
      ) ,
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
final Rx<int> selectedIndex = 0.obs;
final screens = [const HomeScreen(), const StoreScreen(), const WishlistScreen(),const SettingsScreen()];
}