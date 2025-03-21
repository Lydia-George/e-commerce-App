import 'package:ecommerce_app/data/repositories/categories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = true.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source (Firestore , API , etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// -- Load Selected category data
Future<List<CategoryModel>> getSubCategories(String categoryId) async{
try{
final subCategories = await _categoryRepository.getSubCategories(categoryId);
return subCategories;
}catch(e){
  TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  return[];
}
}
  /// Get Category or Sub-Category Products.
Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async{
    // Fetch limited (4) products against each subCategory;
  try{
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;

  }catch(e){
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    return [];
  }

}
}
