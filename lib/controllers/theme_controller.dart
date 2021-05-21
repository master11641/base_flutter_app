import 'package:base_flutter_app/model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ThemeContoller extends GetxController {

  String themeName = "Default";
  var currentTheme = AppTheme("", null).obs;
  var themeData = ThemeData(
    primarySwatch: Colors.blue,
  ).obs;
  int themeIndex = 0;
  ThemeContoller() {
    buildThemeData();
  }
  void buildThemeData({int themeIndex = 0}) {
   this.themeIndex = themeIndex;
    currentTheme.value = myThemes[themeIndex];
    themeData( ThemeData(
          brightness: currentTheme.value.theme?.brightness,
          primarySwatch: currentTheme.value.theme?.primarySwatch,
          primaryColor: currentTheme.value.theme?.primaryColor,
          tabBarTheme: currentTheme.value.theme?.tabBarTheme,
          textTheme: currentTheme.value.theme?.textTheme,
          buttonTheme: currentTheme.value.theme?.buttonThemeData,
          inputDecorationTheme: currentTheme.value.theme?.inputDecorationTheme));
          update(); 
    // themeData.update((x) {
    //   x = ThemeData(
    //       brightness: currentTheme.value.theme.brightness,
    //       primarySwatch: currentTheme.value.theme.primarySwatch,
    //       primaryColor: currentTheme.value.theme.primaryColor,
    //       tabBarTheme: currentTheme.value.theme.tabBarTheme,
    //       textTheme: currentTheme.value.theme.textTheme,
    //       buttonTheme: currentTheme.value.theme.buttonThemeData,
    //       inputDecorationTheme: currentTheme.value.theme.inputDecorationTheme);
    // });
    //themeData.refresh();
  }
}
