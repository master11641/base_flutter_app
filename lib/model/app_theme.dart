import 'package:base_flutter_app/constants/custom_color.dart';

import 'package:flutter/material.dart';

class MyTheme {
  Brightness? brightness;
  MaterialColor? primarySwatch;
  Color? primaryColor;
  TextTheme? textTheme;
  ButtonThemeData? buttonThemeData;
  InputDecorationTheme? inputDecorationTheme;
  TabBarTheme? tabBarTheme;
  MyTheme(
      {this.brightness,
      this.primarySwatch,
      this.primaryColor,
      this.textTheme,
      this.buttonThemeData,
      this.inputDecorationTheme,
      this.tabBarTheme});
}

class AppTheme {
  String name;
  MyTheme? theme;

  AppTheme(this.name, this.theme);
}

List<AppTheme> myThemes = [
  AppTheme(
      'Default',
      MyTheme(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          primaryColor: Colors.white,
          textTheme: TextTheme(
              headline: TextStyle(
                  color: CustomColor.dark_grey,
                  fontFamily: 'IRANSansMobile(FaNum)',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              body1: TextStyle(
                  color: CustomColor.dark_grey,
                  fontFamily: 'IRANSansMobile(FaNum)',
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              title: TextStyle(
                  color: CustomColor.dark_grey,
                  fontFamily: 'IRANSansMobile(FaNum)',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              subhead: TextStyle(
                  color: CustomColor.grey,
                  fontFamily: 'IRANSansMobile(FaNum)',
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              button: TextStyle(
                  color: Colors.white, fontFamily: 'IRANSansMobile(FaNum)')),
          buttonThemeData: ButtonThemeData(           
            buttonColor: CustomColor.primaryColor,
            textTheme:  ButtonTextTheme.primary,
   
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            //textTheme: ButtonTextTheme.accent,
          ),
          inputDecorationTheme: new InputDecorationTheme(
            fillColor: Color.fromRGBO(100, 140, 255, 1.0),
            filled: false,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelPadding: EdgeInsets.all(5.0),
            labelColor: CustomColor.primaryColor,
            unselectedLabelColor: Colors.black12,
          ))),
  AppTheme(
      'Teal',
      MyTheme(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
        textTheme: TextTheme(
            headline: TextStyle(
                color: CustomColor.nearlyDarkBlue,
                fontFamily: 'IRANSansMobile(FaNum)',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
            body1: TextStyle(
                color: CustomColor.nearlyDarkBlue,
                fontFamily: 'IRANSansMobile(FaNum)',
                fontSize: 14.0),
            button: TextStyle(
                color: Colors.white, fontFamily: 'IRANSansMobile(FaNum)')),
        buttonThemeData: ButtonThemeData(
          buttonColor: Color.fromRGBO(255, 213, 79, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: new InputDecorationTheme(
          fillColor: Color.fromRGBO(100, 140, 255, 1.0),
          filled: false,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelPadding: EdgeInsets.all(5.0),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black12,
        ),
      )),
  AppTheme(
      'Orange',
      MyTheme(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        textTheme: TextTheme(
            headline: TextStyle(
                color: CustomColor.nearlyDarkBlue,
                fontFamily: 'IRANSansMobile(FaNum)',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
            body1: TextStyle(
                color: CustomColor.nearlyDarkBlue,
                fontFamily: 'IRANSansMobile(FaNum)',
                fontSize: 14.0),
            button: TextStyle(
                color: Colors.white, fontFamily: 'IRANSansMobile(FaNum)')),
        buttonThemeData: ButtonThemeData(
          buttonColor: Color.fromRGBO(100, 140, 255, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // textTheme: ButtonTextTheme.accent,
        ),
        inputDecorationTheme: new InputDecorationTheme(
          fillColor: Color.fromRGBO(100, 140, 255, 1.0),
          filled: false,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelPadding: EdgeInsets.all(5.0),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black12,
        ),
      )),
  AppTheme(
      'Dark',
      MyTheme(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.black,
        textTheme: TextTheme(
            headline: TextStyle(
                color: Colors.white,
                fontFamily: 'IRANSansMobile(FaNum)',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
            body1: TextStyle(
                color: Colors.white,
                fontFamily: 'IRANSansMobile(FaNum)',
                fontSize: 14.0),
            button: TextStyle(
                color: Colors.white, fontFamily: 'IRANSansMobile(FaNum)')),
        buttonThemeData: ButtonThemeData(
          buttonColor: Color.fromRGBO(100, 140, 255, 1.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // textTheme: ButtonTextTheme.accent,
        ),
        inputDecorationTheme: new InputDecorationTheme(
          fillColor: Color.fromRGBO(100, 140, 255, 1.0),
          filled: false,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelPadding: EdgeInsets.all(5.0),
          labelColor: CustomColor.nearlyDarkBlue,
          unselectedLabelColor: Colors.white,
        ),
      )),
];
