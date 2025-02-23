import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Helper functions for cloud-related operations.
class TCloudHelperFunctions {
  /// Helper function to check the state of a single database record.
  ///
  /// Returns a widget based on the state of the snapshot.
  /// If data is still loading , it returns a circularProgressIndicator.
  /// If no data is found , it returns a generic 'No Data Found' message
  /// If an error occurs , it returns a generic error message
  /// otherwise, it returns null.

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator(),);
    }

    if(!snapshot.hasData || snapshot.data == null){
      return const Center(child: Text('No Data Found!'));
    }


    if (snapshot.hasError){
      return const Center(child: Text('Something went wrong'),);
    }
    return null;
  }

/// Helper function to check the state of a multiple (list) database records.
///
/// Returns a widget based on the state of the snapshot.
/// If data is still loading , it returns a circularProgressIndicator.
/// If no data is found , it returns a generic 'No Data Found' message or a custom nothingFoundWidget if provided
/// If an error occurs , it returns a generic error message
/// otherwise, it returns null.

static Widget? checkMultiRecordState<T>({required AsyncSnapshot<List<T>> snapshot , Widget? loader, Widget? error , Widget? nothingFound}){

    if(snapshot.connectionState == ConnectionState.waiting){
      if(loader != null) return loader;
      return const Center(child: CircularProgressIndicator(),);
    }


    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
      if(nothingFound != null) return nothingFound;
      return const Center(child: Text('No Data Found !'),);
    }

    if(snapshot.hasError){
      if(error != null) return error;
      return const Center(child: Text('Something Went Wrong'),);
    }
    return null;
}



}