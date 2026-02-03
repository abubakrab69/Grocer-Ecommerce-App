import 'package:ecommerceapp/view/home/screens/home_screen.dart';
import 'package:ecommerceapp/view/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  final Approutes = [
    GetPage(name: 'splash_screen', page: () => SplashScreen()),
    GetPage(name: 'home_screen', page: () => HomeScreen()),
  ];
}
