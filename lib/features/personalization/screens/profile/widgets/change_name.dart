import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: dark ? TColors.secondaryColor : TColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          TSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: dark ? TColors.secondaryColor : TColors.primaryColor),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// Text field and Button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator:  (value) => TValidator.validateEmptyText('First name ', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                      floatingLabelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor)
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value)=> TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                    floatingLabelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor)
                  ),
                )
              ],
            )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: dark? TColors.secondaryColor : TColors.primaryColor,
                  side: BorderSide.none
                ),
                  onPressed: ()=> controller.updateUserName(),

                  child:  Text('Save', style: TextStyle(color: dark? TColors.primaryColor : TColors.secondaryColor),)),
            )
          ],
        ),
      ),
    );
  }
}
