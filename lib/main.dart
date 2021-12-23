import 'package:flutter/material.dart';
import 'package:my_first_app/theme/app_colors.dart';
import 'package:my_first_app/ui/auth/auth_widget.dart';
import 'package:my_first_app/ui/main_screen/main_screen.dart';
import 'package:my_first_app/ui/online_shop.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(OnlineShop());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           appBarTheme:
//               const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
//           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//               backgroundColor: AppColors.mainDarkBlue,
//               selectedItemColor: Colors.white,
//               unselectedItemColor: Colors.green),
//         ),
//         routes: {
//           '/auth': (context) => AuthWidget(),
//           '/main_screen': (context) => MainScreenWidget(),
//         },
//         initialRoute: '/auth');
//   }
// }
