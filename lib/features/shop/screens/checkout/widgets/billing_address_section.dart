
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: (){},
          textColor: dark ? TColors.secondaryColor : TColors.primaryColor,
        ),
        Text("Maria Doe", style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? TColors.secondaryColor: TColors.primaryColor),),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey , size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("+20 127 894 3657",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor),)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey , size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("Cairo, Egypt",style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor),)
          ],
        ),

      ],
    );
  }
}
