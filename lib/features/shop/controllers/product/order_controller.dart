import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/order/order_repository.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's Order History
  Future<List<OrderModel>> fetchUserOrder() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  /// Add Methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Order', TImages.pencilAnimation);

      // Get User authentication ID
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
          // Generate a unique ID for the order
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          // Set Date as needed
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList());

      // Save the Order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart Status
      cartController.clearCart();

      // Show Success Screen
      Get.off(() => SuccessScreen(
          image: TImages.orderCompleteAnimation,
          title: 'Payment Success!',
          subTitle: 'Your Item Will be Shipped soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap' , message: e.toString());
    }
  }
}
