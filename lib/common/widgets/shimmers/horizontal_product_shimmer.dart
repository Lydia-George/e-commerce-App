import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        // itemCount --> Decides how many items to show
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        // SeparatorBuilder --> Adds Space between items (not at the end)
        separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems,),

        // Item Builder --> Builds each item (Like a product)
        itemBuilder: (_, __) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems /2,),
                TShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSizes.spaceBtwItems /2,),
                TShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSizes.spaceBtwItems /2 ,),
                TShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )

          ],
        ),

      ),
    );
  }
}
