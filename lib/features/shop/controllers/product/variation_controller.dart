import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VariationController extends GetxController {
  //This line provides a way to get the instance of VariationController from
  // anywhere in the app using VariationController.instance.
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;

//reactive string that shows the stock status (like "In Stock" or "Out of Stock") of the selected variation.
  RxString variationStockStatus = ''.obs;

  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// -- Select Attribute, and Variation
  /// intended to handle what happens when a user selects an attribute (like a color or size) for a product.
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    //When attribute is selected we will first add that attribute to selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
    orElse: () => ProductVariationModel.empty(),
    );

    // show the selected Variation image as a Main Image
    if(selectedVariation.image.isNotEmpty){
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Show Selected Variation quantity already in the cart.
    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign Selected Variation
    this.selectedVariation.value = selectedVariation;

    // Update Selected product variation status
    getProductVariationStockStatus();

  }

  /// -- Check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 then return. this means that current variation isn't selected
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return . e.g. [Green , Large] x [Green , small]
    for (final key in variationAttributes.keys) {
      // Attributes[key] = value which could be [ Green , Small , scented]
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// -- Check Attribute availability / Stock in Variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations.where((variation) =>
    // Check Empty / Out of stock Attributes
      variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
    // Fetch all non-empty attributes of variations
    .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }


  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  /// -- Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// -- Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
