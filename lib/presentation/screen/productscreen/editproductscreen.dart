import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class EditProduct extends StatelessWidget {
  EditProduct({Key? key}) : super(key: key);

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
                    heading: "Product",
                    subheading: "Edit Product",
                    heightSize: 20,
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //enter category name//
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product Name"),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Product Name",
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
                  SizedBox(
                    height: 15,
                  ),

                  ///select default category
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/addnewdefaultproduct');
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(69, 38, 146, 235),
                        border: Border.all(
                          width: 1,
                          color: Colors.green,
                        ),
                      ),
                      child: Center(
                        child: Text("Choose from default Product"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //select iamge for category//
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Image"),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(69, 38, 146, 235),
                            border: Border.all(
                              width: 1,
                              color: Colors.green,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Upload image"),
                                  Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                            Text("Product Quantity"),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Product Quantity",
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
                              hint: Text("Units"),
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
                          children: [
                            Text("Product Price"),
                            SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField(
                              hint: Text("AED"),
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
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(""),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Product Quantity",
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
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Product Price"),
                            SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField(
                              hint: Text("AED"),
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
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(""),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Product Quantity",
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
                    ],
                  ),

                  SizedBox(
                    height: 20,
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
