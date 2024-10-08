import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/presentation/provider/category_provider.dart';
import 'package:vendorsouqjumla/presentation/provider/default_category_provider.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';
import 'package:vendorsouqjumla/presentation/widgets/showalerthideanddelete.dart';

class Categoryscreen extends StatefulWidget {
  final String? loginToken;
  const Categoryscreen({Key? key, required this.loginToken}) : super(key: key);

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  void initState() {
    _showEditbuttons = false;
    print('login tokenaaaaaaaaaaaa : ${widget.loginToken}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<CategoryProvider>(context, listen: false)
      //     .getCategoryData(widget.loginToken);
      Provider.of<DefaultCategoryProvider>(context, listen: false)
          .getDefaultCategory();
    });
    super.initState();
  }

  bool _showEditbuttons = false;

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
      body: Consumer2<CategoryProvider, DefaultCategoryProvider>(
        builder: (context, categoryProvider, defaultCategoryProvider, child) {
          if (defaultCategoryProvider.isLoading == true) {
            // Show a loading state or an empty state when data is not available
            return Center(child: CircularProgressIndicator());
          }
          if (defaultCategoryProvider.errorMessage != null) {
            // Show a loading state or an empty state when data is not available
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${defaultCategoryProvider.errorMessage}',
                  ),
                  TextButton(
                      onPressed: () {
                        defaultCategoryProvider.getDefaultCategory();
                      },
                      child: Text('retry')),
                ],
              ),
            );
          }
          if (defaultCategoryProvider.defaultCategoryLIst == null) {
            // Show a loading state or an empty state when data is not available
            return Center(child: CircularProgressIndicator());
          }
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
                      SizedBox(
                        height: 20,
                      ),
                      headingandsubheadwidget(
                        heading: "Categories",
                        subheading: "",
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //new offer
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/addnewcategory');
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
                                  "Add new category",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
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
                          return Row(
                            children: [
                              _showEditbuttons == true
                                  ? IconButton(
                                      onPressed: () {
                                        showDeleteConfirmationDialog(
                                            context,
                                            defaultCategoryProvider
                                                .defaultCategoryLIst![index].id
                                                .toString(),
                                            'Hide Category',
                                            'Are you sure you want to Hide this item?',
                                            'hide'
                                            );
                                      },
                                      icon: Icon(Icons.hide_source_sharp))
                                  : SizedBox(),
                              SizedBox(
                                width: 15,
                              ),
                              _showEditbuttons == true
                                  ? IconButton(
                                      onPressed: () {
                                        showDeleteConfirmationDialog(
                                            context,
                                            defaultCategoryProvider
                                                .defaultCategoryLIst![index].id
                                                .toString(),
                                            'Delete Category',
                                            'Are you sure you want to delete this item?',
                                            'delete',
                                            );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                  : SizedBox(),
                              Expanded(
                                child: AnimatedContainer(
                                  curve: Curves.easeInOut,
                                  duration: Duration(seconds: 2),
                                  margin: _showEditbuttons == false
                                      ? EdgeInsets.only(left: 0)
                                      : EdgeInsets.only(left: 20),
                                  // duration: Duration(milliseconds: 2000),
                                  height: 80,
                                  width: 100, // Change width based on state
                                  // curve: Curves.easeInOut, // Animation curve
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      leading: Container(
                                        height: 52,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: defaultCategoryProvider
                                                        .defaultCategoryLIst![
                                                            index]
                                                        .image ==
                                                    null
                                                ? AssetImage(
                                                    'assets/images/loginbg.jpeg')
                                                : NetworkImage(
                                                    "https://souq-jumla.noviindusdemosites.in/${defaultCategoryProvider.defaultCategoryLIst![index].image}",
                                                  ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "${defaultCategoryProvider.defaultCategoryLIst![index].engTitle}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${defaultCategoryProvider.defaultCategoryLIst![index].productscount}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text("Items"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount:
                            defaultCategoryProvider.defaultCategoryLIst!.length,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Navigator.pushNamed(context, '/editCategoryanddelete');
          setState(() {
            _showEditbuttons = !_showEditbuttons;
          });
          print('123');
          print('is $_showEditbuttons');
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
