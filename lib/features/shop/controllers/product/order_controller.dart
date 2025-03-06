import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's Order History
Future<List<OrderModel>> fetchUserOrder() async{
  try{
    final userOrders = await orderRepository.fetchUserOrders();
    return userOrders;
  }catch(e){
    TLoaders.warningSnackBar(title: 'Oh Snap' , message:  e.toString());
    return[];
  }
}

 /// Add Methods for order processing

}