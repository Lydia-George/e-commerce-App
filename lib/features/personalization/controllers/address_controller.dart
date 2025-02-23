import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:ecommerce_app/utlis/helpers/network_manager.dart';
import 'package:ecommerce_app/utlis/popups/circular_loader.dart';
import 'package:ecommerce_app/utlis/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utlis/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/repositories/address/address_repository.dart';
import '../../../utlis/constants/image_strings.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  // now it is the observable variable which is going to be observed by the OBX widget, whenever there is change that OBX is going to redraw all widgets inside its child
  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch All user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not Found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: CupertinoColors.transparent,
        content: const TCircularLoader(),
      );

      // Clear the "Selected field"
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add New Address
  Future addNewAddress() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim(),
          postalCode: postalCode.text.trim(),
          selectedAddress: true);
      final id = await addressRepository.addAddress(address);

      // Update Selected Address Status
      address.id = id;
      await selectedAddress(address);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations ' , message: 'Your Address has been Saved Successfully.');

      // Refresh Address Data
      refreshData.toggle();

      // Reset Fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found' , message: e.toString());
    }
  }

  /// Function to reset form fields
  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

}
