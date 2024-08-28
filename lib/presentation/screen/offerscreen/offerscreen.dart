import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Offerscreen extends StatelessWidget {
  const Offerscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> isActiveornot = ['active', 'inactive', 'active'];
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
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (conext, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Padding(
            padding: isTablet
                ? const EdgeInsets.only(left: 50, right: 50)
                : const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                headingandsubheadwidget(
                  heading: "Offers",
                  subheading: "",
                ),
                SizedBox(
                  height: 20,
                ),

                //new offer
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/addnewoffer');
                    print("Add New Offer");
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(136, 4, 72, 77),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text(
                            "Add New Offers",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //active or in active section

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 259,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 233, 231, 224),
                        border: Border.all(width: 1, color: Colors.green),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    // color: const Color.fromARGB(255, 122, 105, 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        offerwidgetfirstsection(
                                          title: "Offer Category",
                                          subTitle: "Fruits",
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        offerwidgetfirstsection(
                                          title: "Offer Category",
                                          subTitle: "Fruits",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 100,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    // color: const Color.fromARGB(255, 122, 105, 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        offerwidgetfirstsection(
                                          title: "Offer Category",
                                          subTitle: "Fruits",
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        offerwidgetfirstsection(
                                          title: "Offer Category",
                                          subTitle: "Fruits",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///offer description start,
                            Divider(),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Offer Description",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Get 10% OFF up to AED 2.12 on Fruit Item",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 5,
                                ),

                                //button active and in active

                                InkWell(
                                  onTap: () {
                                    // print(isActiveornot[index]);
                                    if (isActiveornot[index] == 'active') {
                                      print('Status is active');
                                      Navigator.pushNamed(
                                          context, '/activeorinactive');
                                    } else {
                                      print('Status is inactive');
                                      Navigator.pushNamed(
                                          context, '/activeorinactive');
                                    }
                                  },
                                  child: Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: isActiveornot[index] == 'active'
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: isActiveornot[index] == 'active'
                                          ? Text(
                                              "status : Active",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              "status : In Active",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 34,
                    );
                  },
                  itemCount: isActiveornot.length,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class offerwidgetfirstsection extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const offerwidgetfirstsection({
    super.key,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        Text(
          "$subTitle",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
