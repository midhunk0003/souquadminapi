import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/presentation/provider/ordersummaryprovider.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/widgets/popupsuccess.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class ActiveOrderSummaryScreen extends StatelessWidget {
  const ActiveOrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool acceptOrder = false;
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
      body: LayoutBuilder(builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return SingleChildScrollView(
          child: Padding(
            padding: isTablet
                ? const EdgeInsets.only(left: 50, right: 50)
                : const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingandsubheadwidget(
                  heading: "Order",
                  subheading: "Order Summary",
                  heightSize: 20,
                ),
                Container(
                  // height: 200,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    myorderdetailswidget(
                                      title: 'Order Number',
                                      subTitle: 'WT0745698542',
                                      isTablet: isTablet,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    myorderdetailswidget(
                                      title: 'Order Number',
                                      subTitle: 'WT0745698542',
                                      isTablet: isTablet,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    myorderdetailswidget(
                                      title: 'Order Number',
                                      subTitle: 'WT0745698542',
                                      isTablet: isTablet,
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
                                child: Column(
                                  children: [
                                    myorderdetailswidget(
                                      title: 'Order Number',
                                      subTitle: 'WT0745698542',
                                      isTablet: isTablet,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    myorderdetailswidget(
                                      title: 'Order Number',
                                      subTitle: 'WT0745698542',
                                      isTablet: isTablet,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    myorderdetailswidget(
                                      title: 'Order Number',
                                      subTitle:
                                          'No, 4, Avenue Bazar,Cross road, Jumeirah,Dubai. 500006',
                                      isTablet: isTablet,
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

                        // table start
                        Container(
                          color: const Color.fromARGB(117, 21, 116, 122),
                          child: Table(
                            columnWidths: {
                              0: FixedColumnWidth(
                                isTablet ? 300.0 : 147.0,
                              ), // Adjust the width of the first column
                            },
                            // defaultColumnWidth: FixedColumnWidth(120.0),
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              verticalInside: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            children: [
                              TableRow(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Item',
                                        style: TextStyle(
                                            fontSize: isTablet ? 40 : 20.0),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Qty',
                                          style: TextStyle(
                                              fontSize: isTablet ? 40 : 20.0))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Amount',
                                          style: TextStyle(
                                              fontSize: isTablet ? 40 : 20.0))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // listviewitems

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Table(
                              columnWidths: {
                                0: FixedColumnWidth(
                                  isTablet ? 300 : 147.0,
                                ), // Adjust the width of the first column
                              },
                              // defaultColumnWidth: FixedColumnWidth(120.0),
                              border: TableBorder(
                                horizontalInside: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                verticalInside: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                              ),
                              children: [
                                TableRow(
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Apple',
                                                style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 26 : 13.0)),
                                          )
                                        ]),
                                    Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('3.5 Kg',
                                            style: TextStyle(
                                                fontSize:
                                                    isTablet ? 26 : 13.0)),
                                      )
                                    ]),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('AED 50.75',
                                              style: TextStyle(
                                                  fontSize:
                                                      isTablet ? 26 : 13.0)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),

                        //total table

                        Container(
                          color: const Color.fromARGB(117, 21, 116, 122),
                          child: Table(
                            // defaultColumnWidth: FixedColumnWidth(120.0),
                            border: TableBorder(),
                            children: [
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Total Expenses',
                                          style: TextStyle(
                                              fontSize: isTablet ? 24 : 16.0),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('AED 261',
                                            style: TextStyle(
                                                fontSize:
                                                    isTablet ? 24 : 16.0)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Total Discounts',
                                          style: TextStyle(
                                              fontSize: isTablet ? 24 : 16.0),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('AED 61',
                                            style: TextStyle(
                                                fontSize:
                                                    isTablet ? 28 : 16.0)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //total calculated
                        ///grand total
                        Divider(),

                        Table(
                          columnWidths: {
                            0: FixedColumnWidth(
                              147.0,
                            ), // Adjust the width of the first column
                          },
                          // defaultColumnWidth: FixedColumnWidth(120.0),
                          border: TableBorder(),
                          children: [
                            TableRow(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Grand Total',
                                        style: TextStyle(
                                            fontSize: isTablet ? 24 : 16.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('AED 200',
                                          style: TextStyle(
                                              fontSize: isTablet ? 24 : 16.0,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // buttons
                SizedBox(
                  height: 14,
                ),
                Consumer<Ordersummaryprovider>(
                  builder: (context, orderSummaryProvider, child) {
                    return GestureDetector(
                      onTap: () {
                        print("view order summary ");
                        // Navigator.pushNamed(context, '/viewordersummary');
                        if (orderSummaryProvider.isAccepted == false) {
                          print('order accepted successfully');
                          acceptOrder = true;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.amber)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Not Accepted"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 7, 180, 16),
                                          ),
                                        ),
                                        onPressed: () {
                                          orderSummaryProvider.acceptedOrder();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              // width: 200,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      199, 11, 133, 37),
                                              behavior: SnackBarBehavior
                                                  .floating, // Allows the margin to be applied
                                              margin: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 10),
                                              content: Text(
                                                "Order Successfully Accepted",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Text("Conform accepted",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          print(acceptOrder);
                        } else {
                          orderSummaryProvider.moveOrderToActive();
                          print('order move to Active order');
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Item Delivered",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // call customer button
                // buttons
                SizedBox(
                  height: 14,
                ),
                Consumer<Ordersummaryprovider>(
                  builder: (context, orderSummaryProvider, child) {
                    return GestureDetector(
                      onTap: () {
                        // print("view order summary ");
                        // if (orderSummaryProvider.isAccepted == false) {
                        //   print('Call customer');
                        //   acceptOrder = true;
                        //   // orderSummaryProvider.acceptedOrder();
                        //   print(acceptOrder);
                        // } else {
                        //   // orderSummaryProvider.moveOrderToActive();
                        //   print('Print Order');
                        // }
                        // Navigator.pushNamed(context, '/viewordersummary');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 122, 10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Call Customer",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<Ordersummaryprovider>(
                  builder: (context, orderSummaryProvider, child) {
                    return GestureDetector(
                      onTap: () {
                        // print("view order summary ");
                        // if (orderSummaryProvider.isAccepted == false) {
                        //   print('Call customer');
                        //   acceptOrder = true;
                        //   // orderSummaryProvider.acceptedOrder();
                        //   print(acceptOrder);
                        // } else {
                        //   // orderSummaryProvider.moveOrderToActive();
                        //   print('Print Order');
                        // }
                        // Navigator.pushNamed(context, '/viewordersummary');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Print Order",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.print,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class myorderdetailswidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isDeleavered;
  final bool isTablet;
  const myorderdetailswidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isDeleavered,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$title",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isTablet ? 28 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              isDeleavered == false
                  ? Expanded(
                      child: Container(
                        width: isTablet ? 100 : 52,
                        height: isTablet ? 28 : 14,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: isTablet ? 4 : 2,
                            ),
                            Center(
                              child: Text(
                                "Active",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isTablet ? 20 : 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          Text(
            "$subTitle",
            style: TextStyle(
              color: Colors.black,
              fontSize: isTablet ? 26 : 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      );
    });
  }
}
