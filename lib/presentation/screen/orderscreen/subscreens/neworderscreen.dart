import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Neworderscreen extends StatelessWidget {
  const Neworderscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<bool> isDelevered = [true, false, false, true];
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
        child: LayoutBuilder(
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
                    heading: "Orders",
                    subheading: "New Orders",
                    heightSize: 20,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: Colors.green,
                          ),
                          // color: Colors.amber,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ///row contetn
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // color: Colors.red,
                                      child: Column(
                                        children: [
                                          myorderdetailswidget(
                                            title: 'Order Number',
                                            subTitle: 'WT0745698542',
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: 'Order Number',
                                            subTitle: 'WT0745698542',
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: 'Order Number',
                                            subTitle: 'WT0745698542',
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    width: 1,
                                    height: 200,
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Expanded(
                                    child: Container(
                                      // color: const Color.fromARGB(255, 135, 22, 187),
                                      child: Column(
                                        children: [
                                          myorderdetailswidget(
                                            title: 'Order Number',
                                            subTitle: 'WT0745698542',
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: isDelevered[index]
                                                ? 'Delivered on'
                                                : 'Delivery by',
                                            subTitle: isDelevered[index]
                                                ? '03-01-2024   02:00PM'
                                                : 'Today at 08:00PM',
                                            isDeleavered: isDelevered[index],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: 'Order Number',
                                            subTitle: 'WT0745698542',
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("view order summary $index");
                                  Navigator.pushNamed(
                                      context, '/viewordersummary');
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View order summary $index",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: isDelevered.length,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class myorderdetailswidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isDeleavered;
  const myorderdetailswidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isDeleavered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$title",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            isDeleavered == false
                ? Container(
                    width: 52,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 2,
                        ),
                        Center(
                          child: Text(
                            "Active",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
        Text(
          "$subTitle",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
