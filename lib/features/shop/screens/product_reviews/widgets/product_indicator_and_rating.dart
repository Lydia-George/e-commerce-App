import 'package:flutter/material.dart';

import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/device/device_utility.dart';
import '../../../../../utlis/helpers/helper_functions.dart';
class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.secondaryColor : TColors.primaryColor),
            )),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtlis.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(TColors.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}