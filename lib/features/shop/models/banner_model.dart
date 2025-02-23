import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final bool active;
  String imageUrl;
  final String targetScreen;

  BannerModel(this.active, this.imageUrl, this.targetScreen);

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(data['Active' ]?? false,
        data['ImageUrl' ]?? '',
        data['TargetScreen' ]?? '');
  }
}
