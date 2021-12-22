

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_first_app/theme/app_colors.dart';

class OnlineShop extends StatelessWidget {
  const OnlineShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: "Our new online shop",

      debugShowCheckedModeBanner: false,
      // initialRoute: RoutePaths.SplashScreen,
      // onGenerateRoute: Routes.generateRoute,
      // initialBinding: BindingsBuilder(() => setupBindings()),
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainDarkBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.green),
        ),
    );
  }
}
