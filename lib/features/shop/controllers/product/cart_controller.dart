import 'package:ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utlis/constants/enums.dart';
import 'package:ecommerce_app/utlis/local_storage/storage_utility.dart';
import 'package:ecommerce_app/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;


  CartController(){
    loadCartItems();
  }

// Add Items in the Cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }
// it mean that current variation is not selected , if it is a variable product then it should have a variation
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: 'Select Variation');
      return;
    }

// Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(
            title: "Oh Snap", message: 'Selected variation is out of Stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackBar(
            title: 'Oh Snap! ', message: 'Selected Product is out of stock');
        return;
      }
    }
    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);
    
    // Check if already added in the Cart
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId );

    if(index >= 0 ){
      // This Quantity is already added or Updated / Removed from the design (cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    }else{
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Your Product has been added to the Cart');

    }

    //The function takes one parameter, item, which is of type CartItemModel.
  // This represents a product the user wants to add to the cart.
    void addOneToCart (CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if (index >=0){
      cartItems[index].quantity += 1;
    } else{
      cartItems.add(item);
    }
    updateCart();
    }

    void removeOneFromCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if(index >= 0){
      if(cartItems[index].quantity >1){
        cartItems[index].quantity -= 1;
      }else{
        // Show Dialog before Completely Removing
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
    }

    void removeFromCartDialog (int index){
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product ? ',
      onConfirm: (){
       // Remove item from the cart
       cartItems.removeAt(index);
       updateCart();
       TLoaders.customToast(message: 'Product removed from the Cart');
       Get.back();
      },
      onCancel:  () => () => Get.back(),
    );
    }

    /// Initialize already added Item's Count in the cart .
   void updateAlreadyAddedProductCount (ProductModel product){
    // If product has no variations then calculate cartEntries and Display total Number.
     // Else make default entries to 0 and show cartEntries when variation is selected.
     if(product.productType == ProductType.single.toString()){
       productQuantityInCart.value = getProductQuantityInCart(product.id);
     }else{
       // Get Selected Variation if any ...
       final variationId = variationController.selectedVariation.value.id;
       if(variationId.isNotEmpty){
         productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
       }else{
         productQuantityInCart.value = 0;
       }
     }
   }

  /// This Function Converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        quantity: quantity ,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,

    );
  }

  /// Update Cart Values
  void updateCart(){
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals(){
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for(var item in cartItems){
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems(){
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

void loadCartItems(){
    final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(cartItemStrings != null){
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  /// Returns the total quantity of a "specific product" in the cart.
  /// It filters cart items by productId and "sums their quantities".
  int getProductQuantityInCart(String productId){
    final foundItem =
    //.where() => Returns all matching items as a list
        cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }


  int getVariationQuantityInCart(String productId , String variationId){
    //firstWhere : Looks for the 1st item that matches both productId and variationId , if no item is found , it returns an empty cartItemModel
    // .firstWhere() => Returns Only the 1st matching item or default value if none is found
    final foundItem = cartItems.firstWhere((item)=> item.productId == productId && item.variationId == variationId,
    orElse: ()=> CartItemModel.empty()
    );
    return foundItem.quantity;
  }

  void clearCart(){
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }



}
