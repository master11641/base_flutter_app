import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get.dart';

import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeContoller());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //themeController.buildThemeData();

    return GetMaterialApp(
      translations: Messages(), // your translations
      locale:
          Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'UK'),
      title: 'Flutter Demo',
      theme: themeController.themeData.value == null
          ? ThemeData(
              primarySwatch: Colors.blue,
            )
          : themeController.themeData.value,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  int _getRandomNumber() {
    Random rnd;
    int min = 1;
    int max = 4;
    rnd = new Random();
    var randomNumber = min + rnd.nextInt(max - min);
    if(randomNumber== Get.find<ThemeContoller>().themeIndex){
        randomNumber = _getRandomNumber();
    }
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(right: 30, left: 30))),
                child: Text('change_local_button_text'.tr),
                onPressed: () {
                  var currentLocale = Get.locale;
                  Get.updateLocale(currentLocale.languageCode == 'fa'
                      ? Locale('en', 'US')
                      : Locale('fa', 'IR'));
                },
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(right: 30, left: 30))),
                child: Text('change_theme_button_text'.tr),
                onPressed: () {
                 
                  var themeIndex = _getRandomNumber();
                  Get.find<ThemeContoller>()
                      .buildThemeData(themeIndex: themeIndex);
                  Get.changeTheme(Get.find<ThemeContoller>().themeData.value);
                },
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Theme.of(context).backgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<ThemeContoller>(
                      builder: (_) => Column(
                        children: [
                          Row(
                            children: [
                              Text('change_local_title_text'.tr),
                              Text(Get.locale.languageCode)
                            ],
                          ),
                          Row(
                            children: [
                              Text('change_theme_title_text'.tr),
                              Text(_.currentTheme.value.name)
                            ],
                          ),
                          Row(
                            children: [
                              Text('hello'.tr),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.phone),
      ),
    );
  }
}

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello Getx Package',
          'title': 'Wellcome',
          'change_local_button_text': 'Change Local',
          'change_theme_button_text': 'Change Theme',
          'change_theme_title_text': 'Active Theme :',
          'change_local_title_text': 'Active Local :',
        },
        'fa_IR': {
          'hello': 'سلام پکیج Getx',
          'title': 'خوش آمدید',
          'change_local_button_text': 'تغییر زبان',
          'change_theme_button_text': 'تغییر تم',
          'change_theme_title_text': 'تم فعال:',
          'change_local_title_text': 'زبان فعال:',
        }
      };
}
