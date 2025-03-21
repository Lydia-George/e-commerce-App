import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// -- AppBar
                TAppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.secondaryColor),
                  ),
                ),

                /// user Profile Card
                TUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                    textColor:
                        dark ? TColors.secondaryColor : TColors.primaryColor,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Addresses",
                    subTitle: 'Set Shopping delivery Address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subTitle: 'Add , remove products and move to checkout',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: 'In-progress and Completed Orders ',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                    textColor:
                        dark ? TColors.secondaryColor : TColors.primaryColor,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload Data to your Cloud Firebase"),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor:
                          dark ? TColors.secondaryColor : TColors.primaryColor,
                    ),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                      activeColor:
                          dark ? TColors.secondaryColor : TColors.primaryColor,
                    ),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: 'Set image quality to be seen ',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor:
                          dark ? TColors.secondaryColor : TColors.primaryColor,
                      inactiveThumbColor:
                          dark ? TColors.secondaryColor : TColors.primaryColor,
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: Text(
                          "LogOut",
                          style: TextStyle(
                              color: dark
                                  ? TColors.secondaryColor
                                  : TColors.primaryColor ,
                          fontSize: 16),
                        ),
                      ),
                      Icon(
                        Icons.logout,
                        color: dark
                            ? TColors.secondaryColor
                            : TColors.primaryColor,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
