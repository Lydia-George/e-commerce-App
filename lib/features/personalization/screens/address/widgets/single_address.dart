import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
            () {
              final selectedAddressId = controller.selectedAddress.value.id;
              final selectedAddress = selectedAddressId == address.id;
          return InkWell(
            onTap: onTap,
            child: TCircularContainer(
              padding: const EdgeInsets.all(TSizes.md),
              width: double.infinity,
              showBorder: true,
              backgroundColor: selectedAddress
                  ? TColors.primaryColor.withOpacity(0.5)
                  : Colors.transparent,
              borderColor: selectedAddress
                  ? Colors.transparent
                  : dark
                  ? TColors.darkerGrey
                  : TColors.grey,
              margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(
                      selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? dark
                          ? TColors.light
                          : TColors.dark
                          : null,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maria Doe",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge!
                            .apply(
                            color:

                            dark ? TColors.secondaryColor : TColors
                                .primaryColor),
                      ),
                      const SizedBox(
                        height: TSizes.sm / 2,
                      ),
                      const Text(
                        "(+20) 1227894365",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: TSizes.sm / 2,
                      ),
                      Text(
                        "25, Ali Mobark st ",
                        softWrap: true,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge!
                            .apply(
                            color:
                            dark ? TColors.secondaryColor : TColors
                                .primaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }

    );
  }
}
