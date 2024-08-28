import 'package:flutter/material.dart';

class Homescreenprovider extends ChangeNotifier {
  List<Map<String, dynamic>> _homeScreenData = [
    {
      'title': 'Orders',
      'iconimg': 'assets/images/homesectionicons/Group.png',
      'routename': '/orders',
    },
    {
      'title': 'Stocks',
      'iconimg': 'assets/images/homesectionicons/Group.png',
      'routename': '/stocks',
    },
    {
      'title': 'Dashboard',
      'iconimg': 'assets/images/homesectionicons/apps.png',
      'routename': '/dashboard',
    },
    {
      'title': 'Categories',
      'iconimg': 'assets/images/homesectionicons/Group2.png',
      'routename': '/category',
    },
    {
      'title': 'Products',
      'iconimg': 'assets/images/homesectionicons/boxes.png',
      'routename': '/products',
    },
    {
      'title': 'Offers',
      'iconimg': 'assets/images/homesectionicons/badge-percent.png',
      'routename': '/offers',
    },
    {
      'title': 'About Us',
      'iconimg': 'assets/images/homesectionicons/Layer_1.png',
      'routename': '/aboutus',
    },
    {
      'title': 'Terms and Conditions',
      'iconimg': 'assets/images/homesectionicons/Layer_1_1.png',
      'routename': '/termandconditions',
    },
    {
      'title': 'Privacy Policy',
      'iconimg': 'assets/images/homesectionicons/Layer_1_1_1.png',
      'routename': '/privacypolicy',
    },
    {
      'title': 'Contact Us',
      'iconimg': 'assets/images/homesectionicons/Group.png',
      'routename': '/contactus',
    },
  ];

  List<Map<String, dynamic>> get homeScreenData => _homeScreenData;
}
