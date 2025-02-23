import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel(this.productId, this.categoryId);


  Map<String, dynamic> toJson(){
    return{
      'productId' : productId,
      'categoryId' : categoryId,
    };
  }

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String , dynamic> ;
    return ProductCategoryModel( data['productId'] as String, data['categoryId'] as String);
  }

}
