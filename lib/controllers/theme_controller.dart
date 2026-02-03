import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();

  final _key = 'isDarkMode';

  ThemeMode get theme => _loadtheme() ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkMode => _loadtheme();

  bool _loadtheme() => _box.read(_key) ?? false;
  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  void toggleTheme() {
    Future.delayed(const Duration(milliseconds: 50), () {
      Get.changeThemeMode(_loadtheme() ? ThemeMode.light : ThemeMode.dark);
      saveTheme(!_loadtheme());
      update();
    });
  }
}
