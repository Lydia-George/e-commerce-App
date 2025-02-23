import 'package:ecommerce_app/bindings/general_bindings.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:ecommerce_app/utlis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoute extends StatelessWidget {
  const AppRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      /// show loader or circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(backgroundColor: TColors.primaryColor,
          body: Center(
            child: CircularProgressIndicator(color: TColors.secondaryColor,),),
          ),
      debugShowCheckedModeBanner: false,
    );
  }
}
