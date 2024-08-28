import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
                    heading: "Products",
                    subheading: "",
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //new offer
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/addnewproduct');
                      print("addnewcategory");
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
                              "Add new Product",
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

                  // List of category
                  SizedBox(
                    height: 25,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Container(
                              height: 52,
                              width: 65,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/category.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            title: Text("Vegetables"),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "67",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("Items"),
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
                    itemCount: 10,
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/editproductanddelete');
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
