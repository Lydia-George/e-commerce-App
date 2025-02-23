import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/all_products_controller.dart';
import 'package:ecommerce_app/utlis/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;

  // Future method is a future of type list of product models , because we at the end want to display a list of products
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          // we want to call the future method we can't use await sign because future method takes time they are going to for
          // the cloud queries and it depends on internet connection , so we need to call await sign
          // but in here in the design cause we can't use await sign and we can't make this build method an async function
          // so to use a func which has a cloud query we have to instead use a future builder , it handles all the methods that are related to future
          // not to use the future builder , we want to use that future builder on top of this sortable products

          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // Check the state of the FutureBuilder snapshot
              const  loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , loader: loader);

              // Return appropriate widget based on snapshot state
              if(widget != null ) return widget;

              // Product Found!
              final products = snapshot.data!;
                return   TSortableProducts(products: products,);
              }),
        ),
      ),
    );
  }
}
