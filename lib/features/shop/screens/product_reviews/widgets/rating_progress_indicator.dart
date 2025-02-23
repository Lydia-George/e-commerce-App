import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/product_indicator_and_rating.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utlis/constants/colors.dart';
class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              "4.8",
              style: Theme.of(context).textTheme.displayLarge!.apply(
                  color: dark
                      ? TColors.secondaryColor
                      : TColors.primaryColor),
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5', value: 1.0,),
              TRatingProgressIndicator(text: '4', value: 0.8,),
              TRatingProgressIndicator(text: '3', value: 0.6,),
              TRatingProgressIndicator(text: '2', value: 0.4,),
              TRatingProgressIndicator(text: '1', value: 0.2,),
            ],
          ),
        )
      ],
    );
  }
}