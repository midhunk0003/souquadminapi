import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/neworderscreen.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Totalorderscreen extends StatelessWidget {
  Totalorderscreen({Key? key}) : super(key: key);

  TextEditingController _dateController = TextEditingController();

  // Assuming you have a DateTime object
// DateTime selectedDate = DateTime.now();

// Format the date to YYYY-MM-DD
// String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

// print(formattedDate); // Output: 2024-08-27

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
                    subheading: "Total Orders",
                    heightSize: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Select Date'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        // flex: 2,
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          child: TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? selectedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (selectedDate != null) {
                                      print(
                                          "Selected Date: ${selectedDate.toLocal()}");
                                      _dateController.text =
                                          DateFormat('dd-MM-yyyy')
                                              .format(selectedDate);
                                    }
                                  },
                                  icon: Icon(Icons.date_range)),
                              border: InputBorder.none,
                              hintText: 'Select Date',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          height: 50,
                          child: Center(
                            child: Text(
                              'Apply Filter',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                                      context, '/viewtotalordersummary');
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
