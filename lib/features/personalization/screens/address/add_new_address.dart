import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/validators/validation.dart';
class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Add new Address",style: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                validator: (value) => TValidator.validateEmptyText('Name', value),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),
                  prefixIcon: const Icon(Iconsax.user),
                  prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,
                  labelText: "Name",

                ),

              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              TextFormField(
                controller: controller.phoneNumber,
                validator: TValidator.validatePhoneNumber,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.mobile),
                  prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,

                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),

                ),

              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.street,
                      validator: (value)=> TValidator.validateEmptyText('Street', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.building_31),
                        prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,

                        labelText: "Street",
                        labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),

                      ),

                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields,),
                  Expanded(
                    child: TextFormField(
                      controller: controller.postalCode,
                      validator:(value) => TValidator.validateEmptyText('Postal Code', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.code),
                        prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,

                        labelText: "Postal Code",
                        labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),

                      ),

                    ),
                  ),

                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.city,
                      validator: (value)=> TValidator.validateEmptyText('City', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.building),
                        prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,

                        labelText: "City",
                        labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),

                      ),

                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields,),
                  Expanded(
                    child: TextFormField(
                      controller: controller.state,
                      validator: (value)=> TValidator.validateEmptyText('State', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.activity),
                        prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,

                        labelText: "Governorate",
                        labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),

                      ),

                    ),
                  ),

                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              TextFormField(
                controller: controller.country,
                validator: (value)=> TValidator.validateEmptyText('Country', value),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: dark ? TColors.secondaryColor : TColors.primaryColor),
                  prefixIcon: const Icon(Iconsax.global),
                  prefixIconColor: dark ? TColors.secondaryColor : TColors.primaryColor,
                  labelText: "Country",

                ),

              ),
              const SizedBox(height: TSizes.defaultSpace,),
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton( style: ElevatedButton.styleFrom(
                    backgroundColor: dark ? TColors.secondaryColor : TColors.primaryColor,
                    side: const BorderSide(color: Colors.transparent),
                  ),
                      onPressed: (){}, child: Text("Save", style: TextStyle(color: dark? TColors.primaryColor : TColors.secondaryColor))))
            ],
          ),
        ),
        ),
      ),
    );
  }
}
