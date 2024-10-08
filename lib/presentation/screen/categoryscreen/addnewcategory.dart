import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/presentation/provider/category_provider.dart';
import 'package:vendorsouqjumla/presentation/provider/default_category_provider.dart';
import 'package:vendorsouqjumla/presentation/provider/imagepickerprovider.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Addnewcategory extends StatefulWidget {
  const Addnewcategory({Key? key}) : super(key: key);

  @override
  State<Addnewcategory> createState() => _AddnewcategoryState();
}

class _AddnewcategoryState extends State<Addnewcategory> {
  TextEditingController _categoryNameController = TextEditingController();
  TextEditingController _categoryArbNameController = TextEditingController();

  @override
  void initState() {
    print('123');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Imagepickerprovider>(context, listen: false).clearImage();
      Provider.of<DefaultCategoryProvider>(context, listen: false)
          .makeDataEmpty();
    });
  }

  String? _categoryImage;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (willPop, result) {
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
        body: Consumer3<Imagepickerprovider, CategoryProvider,
            DefaultCategoryProvider>(
          builder: (
            context,
            imagePckerProvider,
            CategoryProvider,
            defaultCategoryProvider,
            child,
          ) {
            if (defaultCategoryProvider.isSavedornot == true) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  Navigator.pop(context);
                },
              );
            }
            _categoryImage = defaultCategoryProvider.gettimage == null
                ? imagePckerProvider.selectImage?.path.toString()
                : defaultCategoryProvider.gettimage.toString();

            _categoryNameController.text =
                defaultCategoryProvider.getteng_title == null
                    ? ''
                    : defaultCategoryProvider.getteng_title!;

            _categoryArbNameController.text =
                defaultCategoryProvider.getteng_title == null
                    ? ''
                    : Utf8Decoder().convert(
                        defaultCategoryProvider.gettarb_title?.codeUnits ?? []);

            print('Getter image path: ${defaultCategoryProvider.gettimage}');

            return SingleChildScrollView(
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
                        headingandsubheadwidget(
                          heading: "Category",
                          subheading: "Add new category",
                          heightSize: 20,
                        ),
                        SizedBox(
                          height: 40,
                        ),

                        //enter category name//
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category Name In english"),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _categoryNameController,
                              decoration: InputDecoration(
                                hintText: "Category Name In english",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Category Name in Arabic"),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _categoryArbNameController,
                              decoration: InputDecoration(
                                hintText: "Category Name in Arabic",
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
                            Navigator.pushNamed(
                                context, '/addnewdefaultcategory');
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
                              child: Text("Choose from default categories"),
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
                              Text("upload category image"),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await imagePckerProvider.pickImage();
                                  defaultCategoryProvider.image = null;
                                },
                                child: imagePckerProvider.selectImage == null &&
                                        defaultCategoryProvider.gettimage ==
                                            null
                                    ? Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              69, 38, 146, 235),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Upload image"),
                                                Icon(
                                                  Icons.image,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : defaultCategoryProvider.gettimage == null
                                        ? Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromARGB(
                                                  69, 38, 146, 235),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.green,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Image.file(
                                                  imagePckerProvider
                                                      .selectImage!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Image.network(
                                            'https://souq-jumla.noviindusdemosites.in/${defaultCategoryProvider.gettimage}',
                                          ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            print('cat id : ${defaultCategoryProvider.gettid}');
                            print(
                                'catEngname : ${_categoryNameController.text}');
                            print(
                                'cat arb n : ${_categoryArbNameController.text}');
                            print('catimage: ${_categoryImage}');
                            // defaultCategoryProvider.makeDataEmpty();
                            if (_categoryNameController.text.isNotEmpty &&
                                _categoryArbNameController.text.isNotEmpty &&
                                _categoryImage!.isNotEmpty) {
                              defaultCategoryProvider.postCategory(
                                defaultCategoryProvider.gettid == null
                                    ? null
                                    : defaultCategoryProvider.gettid,
                                _categoryNameController.text.toString(),
                                _categoryArbNameController.text.toString(),
                                _categoryImage,
                              );

                              print('post success');
                            } else {
                              print('fill the field');
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  defaultCategoryProvider.isPostLoading == true
                                      ? Colors.black
                                      : Colors.green,
                              border: Border.all(
                                width: 1,
                                color: Colors.green,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                defaultCategoryProvider.isPostLoading == true
                                    ? "Loading..."
                                    : "Save",
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
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
