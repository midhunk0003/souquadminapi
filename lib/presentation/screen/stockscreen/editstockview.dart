import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Editstockview extends StatelessWidget {
  Editstockview({Key? key}) : super(key: key);

  String? _SelectedItems;

  @override
  Widget build(BuildContext context) {
    List<String?> itemList = ['11', '12', '32', '14'];
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
                : const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingandsubheadwidget(
                    heading: "Stock",
                    subheading: "Vegitables",
                    heightSize: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Select product"),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField(
                    hint: Text("Select product"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: _SelectedItems,
                    items: itemList.map(
                      (String? newValue) {
                        return DropdownMenuItem(
                          value: newValue,
                          child: Text("$newValue"),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      _SelectedItems = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Stocks"),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Total Stocks",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                            SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField(
                              hint: Text("Kg"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              value: _SelectedItems,
                              items: itemList.map((String? newValue) {
                                return DropdownMenuItem(
                                  value: newValue,
                                  child: Text("$newValue"),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _SelectedItems = value;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pending Stocks"),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Pending Stocks",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(""),
                            SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField(
                              hint: Text("Kg"),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              value: _SelectedItems,
                              items: itemList.map((String? newValue) {
                                return DropdownMenuItem(
                                  value: newValue,
                                  child: Text("$newValue"),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _SelectedItems = value;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                      border: Border.all(
                        width: 1,
                        color: Colors.green,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
