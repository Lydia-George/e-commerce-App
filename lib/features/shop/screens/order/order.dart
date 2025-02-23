import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/orders_list.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/constants/sizes.dart';
import 'package:ecommerce_app/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark? TColors.secondaryColor : TColors.primaryColor),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// Orders
        child: TOrdersListItems(),
      ),
    );
  }
}
