import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /* ----------------------------- Functions ----------------------------- */

/// Get all order related to Current User
Future<List<OrderModel>> fetchUserOrders() async{
  try{
    final userId = AuthenticationRepository.instance.authUser?.uid;
    if(userId!.isEmpty) throw 'Unable to find user Information. Try again in few minutes.';

    final result = await _db.collection('Users').doc(userId).collection('Orders').get();
    return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();

  }catch(e){
    throw 'Something went wrong while fetching Order Information. Try again later';
  }
}

/// Store new user Order
 Future<void> saveOrder (OrderModel order , String userId) async{
  try{
    await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
  }catch(e){
    throw 'Something went wrong while saving order Information. Try again later';
  }
 }

}