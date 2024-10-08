import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3000), () {
      _navigationTOloginscreenOrHomeScreenIfTokenSave();
    });
    super.initState();
  }

  Future<void> _navigationTOloginscreenOrHomeScreenIfTokenSave() async {
    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');
    print('login token splash screen : ${loginToken}');
    if (loginToken != null) {
      print('have login token 88888888888888');
      Navigator.pushReplacementNamed(
        context,
        '/homeScreen',
      );
    } else {
      final pred = await SharedPreferences.getInstance();
      final String? onbordKeySave = pref.getString('onboard_key');
      print('onboard token : ${onbordKeySave}');
      if (onbordKeySave != null) {
        print('login');
        Navigator.pushReplacementNamed(context, '/loginPage');
      } else {
        print('onbord');
        Navigator.pushReplacementNamed(context, '/onbordScreen');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 241, 241, 241),
              image: DecorationImage(
                image: AssetImage('assets/images/bgadminsplash.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          // logo
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
