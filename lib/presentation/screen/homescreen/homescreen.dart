import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/presentation/provider/homescreenProvider.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hellow",
              style: TextStyle(fontSize: 12),
            ),
            Container(
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
          ],
        ),
        automaticallyImplyLeading1: false,
      ),
      body: Consumer<Homescreenprovider>(
        builder: (context, homeProvider, child) {
          return LayoutBuilder(
            builder: (context, constrains) {
              bool isTbalet = constrains.maxWidth > 600;
              return Padding(
                padding: isTbalet
                    ? const EdgeInsets.only(left: 50, right: 50)
                    : const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final items = homeProvider.homeScreenData[index];
                    return GestureDetector(
                      onTap: () {
                        print("index:$index");
                        final routname = items['routename'];
                        print(routname);
                        Navigator.pushNamed(context, '$routname');
                      },
                      child: Container(
                        height: isTbalet ? 140 : 80,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: isTbalet ? 200 : 120,
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage("${items['iconimg']}"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${items['title']}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                size: isTbalet ? 30 : 20,
                                Icons.arrow_forward_ios,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: homeProvider.homeScreenData.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
