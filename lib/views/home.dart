// ignore_for_file: unnecessary_import, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insurance/config/constants.dart';
import 'package:insurance/controllers/homecontroller.dart';
import 'package:insurance/views/dashboard.dart';
import 'package:insurance/views/notifications.dart';
import 'package:insurance/views/profile.dart';
import 'package:insurance/views/settings.dart';
import 'package:insurance/views/signin.dart';
import 'package:insurance/views/signup.dart';

HomeController homeController = Get.put(HomeController());
var screens = [
  Dashboard(),
  Notifications(),
  ProfilePage(),
  SettingsPage(),
];

class Home extends StatelessWidget {
  //final String customerName;

  // Dashboard({required this.customerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Better Insurance"),
          backgroundColor: primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("/SignIn");
                },
                icon: Icon(Icons.logout))
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: primaryColor,
            color: primaryColor,
            buttonBackgroundColor: appBlackColor,
            items: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              )
            ],
            onTap: (index) {
              homeController.updateSelectedPage(index);
            }),
        body: Obx(() => IndexedStack(
              children: screens,
              index: homeController.selectedPage.value,
            )));
  }
}
