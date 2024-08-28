import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({Key? key}) : super(key: key);

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Padding(
            padding: isTablet
                ? const EdgeInsets.only(left: 50, right: 50)
                : const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingandsubheadwidget(
                  heightSize: 20,
                  heading: "Orders",
                  subheading: "",
                ),
                SizedBox(
                  height: 20,
                ),
                orderswidget(
                  title: 'New Orders',
                  OnTapRoute: '/neworders',
                  newOrder: true,
                  totalorders: '6',
                ),
                SizedBox(
                  height: 20,
                ),
                orderswidget(
                  title: 'Total Orders',
                  OnTapRoute: '/totalorders',
                  totalorders: '167',
                ),
                SizedBox(
                  height: 20,
                ),
                orderswidget(
                  title: 'Active Orders',
                  OnTapRoute: '/activeorders',
                  totalorders: '12',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class orderswidget extends StatelessWidget {
  final String? title;
  final String? OnTapRoute;
  final bool? newOrder;
  final String? totalorders;
  const orderswidget({
    super.key,
    this.title,
    this.OnTapRoute,
    this.newOrder,
    this.totalorders,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$OnTapRoute");
        Navigator.pushNamed(context, '$OnTapRoute');
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Center(
          child: ListTile(
              leading: newOrder != null
                  ? Stack(
                      children: [
                        Container(
                          // color: Colors.amber,
                          width: 120,
                          child: Text(
                            "$title",
                            style: TextStyle(
                              // backgroundColor: Colors.amber,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        newOrder! == true
                            ? Positioned(
                                left: 70,
                                right: 10,
                                top: 1,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 5,
                                ),
                              )
                            : SizedBox()
                      ],
                    )
                  : Text(
                      "$title",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              trailing: Text(
                "$totalorders",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),
      ),
    );
  }
}
