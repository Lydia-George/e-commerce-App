import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utlis/constants/image_strings.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  "Maria Doe",
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                      color:
                          dark ? TColors.secondaryColor : TColors.primaryColor),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: dark ? TColors.secondaryColor : TColors.primaryColor,
                ))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              "01 Nov, 2023",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.secondaryColor : TColors.primaryColor),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ",
          style: TextStyle(
              color: dark ? TColors.secondaryColor : TColors.primaryColor),
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: "Show less",
          trimCollapsedText: "Show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: dark ? TColors.white : Colors.black),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: dark ? TColors.white : Colors.black),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Company Review
        TCircularContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.darkGrey,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lady Hand",style: Theme.of(context).textTheme.titleMedium!.apply(color: dark ? TColors.secondaryColor : TColors.primaryColor),),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Text(
                    "02 Nov, 2023",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.secondaryColor : TColors.primaryColor),
                  ),                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ReadMoreText(
                "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ",
                style: TextStyle(
                    color: dark ? TColors.secondaryColor : TColors.primaryColor),
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimExpandedText: "Show less",
                trimCollapsedText: "Show more",
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: dark ? TColors.white : Colors.black),
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: dark ? TColors.white : Colors.black),
              ),
            ],
          ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
