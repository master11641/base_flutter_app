import 'dart:math';

import 'package:base_flutter_app/pages/stores/stores_controller.dart';
import 'package:base_flutter_app/pages/stores/views/stores_horizontal.dart';

import 'package:base_flutter_app/tools/popup.dart';
import 'package:base_flutter_app/tools/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get.dart';

import 'controllers/theme_controller.dart';
import 'model/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(StoreController());
  await runSamples();
  runApp(MyApp());
}

Future runSamples() async {
  final category = await Category().select().toSingle();
  if (category == null) {
    await Category(name: 'Notebooks', isActive: true).save();
    await Category(name: 'Ultrabooks', isActive: true).save();
  } else {
    print(
        'There is  already categories in the database.. addCategories will not run');
  }
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeContoller());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //themeController.buildThemeData();

    return GetMaterialApp(    
      debugShowCheckedModeBanner: false,
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
  final StoreController _storeController = Get.find<StoreController>();
  MyHomePage() : super();
  int _getRandomNumber() {
    Random rnd;
    int min = 1;
    int max = 4;
    rnd = new Random();
    var randomNumber = min + rnd.nextInt(max - min);
    if (randomNumber == Get.find<ThemeContoller>().themeIndex) {
      randomNumber = _getRandomNumber();
    }
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: sideBarWidget()),
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      body: Column(children: [
        Column(
          children: [
            SizedBox(
              height: 15,
            ),
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
                    Get.updateLocale(currentLocale!.languageCode == 'fa'
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
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(right: 30, left: 30))),
                  child: Text('category_edit_button'.tr),
                  onPressed: () async {
                    Get.to(CategoryAdd(await Category().getById(1)));
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
                  child: Text('show_popup_button'.tr),
                  onPressed: () async {
                    showPopup(
                        context,
                        Column(
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Text('blablabla...'),
                            Text('blablabla...'),
                          ],
                        ),
                        'show_popup_button'.tr);
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
                  child: Text('infinit_scroll'.tr),
                  onPressed: () async {
                    // var response =
                    //     await NetService.fetchJsonData(Urls.storesUrl);
                    //print(response);
                    _storeController.fetchData();
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
                                Text(Get.locale!.languageCode)
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
                            Obx(
                              () => Text(
                                '${_storeController.currentPage}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StoresHorizontal(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
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
          'category_edit_button': 'Edit Category',
          'show_popup_button': 'Show Popup',
          'infinit_scroll': 'Fetch Infinit Data',
        },
        'fa_IR': {
          'hello': 'سلام پکیج Getx',
          'title': 'خوش آمدید',
          'change_local_button_text': 'تغییر زبان',
          'change_theme_button_text': 'تغییر تم',
          'change_theme_title_text': 'تم فعال:',
          'change_local_title_text': 'زبان فعال:',
          'category_edit_button': 'ویرایش گروه',
          'show_popup_button': 'نمایش پیغام',
          'infinit_scroll': 'گرفتن داده بینهایت',
        }
      };
}
