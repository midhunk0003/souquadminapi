import 'package:flutter/material.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';

class Notificationscreen extends StatelessWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 34,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading1: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
