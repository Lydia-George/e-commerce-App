import 'package:ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_app/utlis/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    /// these bindings will automatically be created when app launch for the first time
    Get.put(NetworkManager());
    Get.put(VariationController());
  }

}