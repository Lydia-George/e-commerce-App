import 'package:flutter/material.dart';


import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/circular_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: TSizes.md, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Have a promo code ? Enter here ",
                hintStyle: TextStyle(
                    color: dark ? TColors.secondaryColor : TColors.primaryColor,
                    fontSize: TSizes.fontSizeSm),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// -- Button
          SizedBox(
            width: 70,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  foregroundColor: dark
                      ? TColors.white.withOpacity(0.5)
                      : TColors.dark.withOpacity(0.5),
                  textStyle: const TextStyle(color: TColors.secondaryColor),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                ),
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: TextStyle(color: dark? TColors.secondaryColor : TColors.primaryColor),
                )),
          )
        ],
      ),
    );
  }
}
