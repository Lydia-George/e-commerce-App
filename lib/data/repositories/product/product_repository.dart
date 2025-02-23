import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utlis/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utlis/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();


  /// Firestore instance for database interactions.
 final _db = FirebaseFirestore.instance;



 /// Get Limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get All featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async{
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

/// Get products based on the query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
/// Get products based on the query
  Future<List<ProductModel>> getFavouriteProducts(List<String> productsIds) async{
    try{
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productsIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId,  int  limit = 4}) async{
    try{
      // query to get all documents where productId matches the provided categoryId & fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
      ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
      : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      // Extract productIds from the documents
      List<String>  productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // Query to get all documents where the BrandId is in the list of BrandIds , FieldPAth.documentId to  query documents in collection
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;




    } on FirebaseException catch(e){
throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


/// Upload dummy data to the cloud firebase

}