import 'dart:convert';

import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/loaders.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  //is used to indicate that a method is being overridden from a superclass or interface.
  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from Storage
void initFavourites() {
final json = TLocalStorage.instance().readData('favourites');
if(json != null){
  final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
  favourites.assignAll(storedFavourites.map((key , value) => MapEntry(key, value as bool)));
}
}


bool isFavourite(String productId){
    //the null-coalescing operator (??) in Dart to return a value from the favourites map.
    return favourites[productId] ?? false;
}

void toggleFavouriteProduct(String productId) {
if(!favourites.containsKey(productId)){
  favourites[productId] = true;
  saveFavouritesToStorage();
  TLoaders.customToast(message: 'Product has been added to the wishlist.');

}else{
  TLocalStorage.instance().removeData(productId);
  favourites.remove(productId);
  saveFavouritesToStorage();
  //The favourites.refresh() ensures that any reactive listeners (e.g., in UI) are updated with the new state.
  favourites.refresh();
  TLoaders.customToast(message: 'Product has been removed from the Wishlist.');
}
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    TLocalStorage.instance().readData('favourites');
  }
  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }

}