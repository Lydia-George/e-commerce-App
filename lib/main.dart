import 'package:ecommerce_app/app_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  ///-- Widgets Bindings
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
 // await FirebaseAppCheck.instance.activate();


  ///-- Init GetX local Storage
  await GetStorage.init();

  // Todo : Await Native Splash
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///--  Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) .then(
          (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  // Todo : Initialize Authentication

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const AppRoute());
}
