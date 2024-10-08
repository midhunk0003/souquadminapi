import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordScreen extends StatelessWidget {
  const OnbordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                      image: AssetImage("assets/images/onbord.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 30)
                      : const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Grow your store\ndigitally with ease.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isTablet ? 40 : 26,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Align(
                            child: GestureDetector(
                              onTap: () async {
                                print("go to login");
                                final pref =
                                    await SharedPreferences.getInstance();
                                pref.setString(
                                    'onboard_key', 'onboardkey123456');
                                Navigator.pushNamed(context, '/loginPage');
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 34,
                                ),
                                height: isTablet ? 130 : 78,
                                width: isTablet ? 170 : 92,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: isTablet
                                        ? Radius.circular(60)
                                        : Radius.circular(39),
                                    bottomLeft: isTablet
                                        ? Radius.circular(60)
                                        : Radius.circular(39),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.green,
                                  size: isTablet ? 60 : 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
