import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/data/constraints/colors.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class ActiveOrInActiveUpdate extends StatelessWidget {
  ActiveOrInActiveUpdate({Key? key}) : super(key: key);

  TextEditingController _offerDescriptionController = TextEditingController();
  TextEditingController _offerPriceController = TextEditingController();
  TextEditingController _dateValidFromController = TextEditingController();
  TextEditingController _dateValidtillController = TextEditingController();

  dynamic _selectedValuePercentage;
  dynamic _selectedValueOfferCategory;
  dynamic _selectedValueChooseProduct;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<double?> _persentage = [10, 20, 40, 50];
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

                  // form section
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offer Description",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              style: TextStyle(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "give offer description",
                                hintStyle: TextStyle(
                                  color: hintTextColor,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter description';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offer Description",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),

                            //2 field
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style: TextStyle(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: "offer price",
                                      hintStyle: TextStyle(
                                        color: hintTextColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter offer price';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.percent),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    hint: Text(
                                      "select",
                                      style: TextStyle(color: hintTextColor),
                                    ),
                                    value: _selectedValuePercentage,
                                    items: _persentage.map((double? newValue) {
                                      return DropdownMenuItem(
                                        value: newValue,
                                        child: Text("$newValue"),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      print(value);
                                      _selectedValuePercentage = value;
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Select %';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // 3 rd field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offer category",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              hint: Text(
                                "Offer category",
                                style: TextStyle(color: hintTextColor),
                              ),
                              value: _selectedValueOfferCategory,
                              items: _persentage.map((double? newValue) {
                                return DropdownMenuItem(
                                  value: newValue,
                                  child: Text("$newValue"),
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(value);
                                _selectedValueOfferCategory = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please Select %';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 25,
                        ),
                        // 4 th field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offer products",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              style: TextStyle(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "Selected products",
                                hintStyle: TextStyle(
                                  color: hintTextColor,
                                ),
                              ),
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter description';
                              //   }
                              //   return null;
                              // },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              hint: Text(
                                "Choose products",
                                style: TextStyle(color: hintTextColor),
                              ),
                              value: _selectedValueChooseProduct,
                              items: _persentage.map((double? newValue) {
                                return DropdownMenuItem(
                                  value: newValue,
                                  child: Text("$newValue"),
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(value);
                                _selectedValueChooseProduct = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please Select %';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        // 5th field

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Valid from"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: TextStyle(),
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Colors.green,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: "DD-MM-YYYY",
                                      hintStyle: TextStyle(
                                        color: hintTextColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter offer price';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Valid till"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: TextStyle(),
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Colors.green,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: "DD-MM-YYYY",
                                      hintStyle: TextStyle(
                                        color: hintTextColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter offer price';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 25,
                        ),
                        //Button part
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print("success data validate");
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "UpDate Offer",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print("success data validate");
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Make InActive",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Cancle",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
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
