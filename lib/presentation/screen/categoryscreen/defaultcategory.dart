import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/data/model/default_category_model/default_category_model.dart';
import 'package:vendorsouqjumla/presentation/provider/category_provider.dart';
import 'package:vendorsouqjumla/presentation/provider/default_category_provider.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Defaultcategory extends StatefulWidget {
  // final String? loginToken;
  const Defaultcategory({
    Key? key,
  }) : super(key: key);

  @override
  State<Defaultcategory> createState() => _DefaultcategoryState();
}

class _DefaultcategoryState extends State<Defaultcategory> {
  @override
  void initState() {
    print('123111111111');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DefaultCategoryProvider>(context, listen: false)
          .getDefaultCategory();
    });
  }

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (willPop, result) {
        Provider.of<CategoryProvider>(context, listen: false);
        Provider.of<DefaultCategoryProvider>(context, listen: false)
            .getDefaultCategory();
      },
      child: Scaffold(
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
        body: Consumer<DefaultCategoryProvider>(
          builder: (context, defaultcategoryprovider, child) {
            if (defaultcategoryprovider.isLoading == true) {
              // Show a loading state or an empty state when data is not available
              return Center(child: CircularProgressIndicator());
            }
            if (defaultcategoryprovider.errorMessage != null) {
              // Show a loading state or an empty state when data is not available
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${defaultcategoryprovider.errorMessage}',
                    ),
                    // TextButton(
                    //     onPressed: () {
                    //       defaultcategoryprovider.getCategoryData(widget.loginToken);
                    //     },
                    //     child: Text('retry')),
                  ],
                ),
              );
            }
            if (defaultcategoryprovider.defaultCategoryLIst == null) {
              // Show a loading state or an empty state when data is not available
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: LayoutBuilder(builder: (context, constraints) {
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
                        height: 25,
                      ),
                      headingandsubheadwidget(
                        heading: 'Add New Category',
                        subheading: 'add new category',
                        heightSize: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Default Category"),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount:
                            defaultcategoryprovider.defaultCategoryLIst!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              final DefaultCategory defaultcategory =
                                  defaultcategoryprovider
                                      .defaultCategoryLIst![index];
                              print("${defaultcategory.engTitle}");
                              print("${index}");
                              setState(() {
                                selectedIndex = index;
                              });
                              defaultcategoryprovider.id =
                                  defaultcategoryprovider
                                      .defaultCategoryLIst![index].id;
                              defaultcategoryprovider.isactive =
                                  defaultcategoryprovider
                                      .defaultCategoryLIst![index].isactive;
                              defaultcategoryprovider.eng_title =
                                  defaultcategoryprovider
                                      .defaultCategoryLIst![index].engTitle;
                              defaultcategoryprovider.arb_title =
                                  defaultcategoryprovider
                                      .defaultCategoryLIst![index].arbTitle;
                              defaultcategoryprovider.image =
                                  defaultcategoryprovider
                                      .defaultCategoryLIst![index].image;
                            },
                            child: index == selectedIndex
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2.5,
                                        color: const Color.fromARGB(
                                            113, 16, 19, 206),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 75,
                                              decoration: BoxDecoration(
                                                // color: const Color.fromARGB(255, 7, 123, 255),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://souq-jumla.noviindusdemosites.in/${defaultcategoryprovider.defaultCategoryLIst![index].image}"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${defaultcategoryprovider.defaultCategoryLIst![index].engTitle}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 20,
                                                  color: const Color.fromARGB(
                                                      113, 16, 19, 206),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color.fromARGB(
                                              150, 158, 158, 158)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 75,
                                              decoration: BoxDecoration(
                                                // color: const Color.fromARGB(255, 7, 123, 255),
                                                image: DecorationImage(
                                                  image: defaultcategoryprovider
                                                              .defaultCategoryLIst![
                                                                  index]
                                                              .image ==
                                                          null
                                                      ? AssetImage(
                                                          'assets/images/loginbg.jpeg')
                                                      : NetworkImage(
                                                          "https://souq-jumla.noviindusdemosites.in/${defaultcategoryprovider.defaultCategoryLIst![index].image}",
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${defaultcategoryprovider.defaultCategoryLIst![index].engTitle}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.green,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          defaultcategoryprovider.prints();

                          Navigator.pop(context);
                        },
                        child: Container(
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
                              "ADD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
