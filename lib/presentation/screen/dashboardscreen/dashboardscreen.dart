import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/data/model/dashboardmodel/dashboardmodel.dart';
import 'package:vendorsouqjumla/presentation/provider/dashboardprovider.dart';
import 'package:vendorsouqjumla/presentation/widgets/customappbar.dart';
import 'package:vendorsouqjumla/presentation/widgets/headingandsubheadingwidget.dart';

class Dashboardscreen extends StatefulWidget {
  final String? loginToken;
  const Dashboardscreen({Key? key, required this.loginToken}) : super(key: key);

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  void initState() {
    print('login tokenaaaaaaaaaaaa : ${widget.loginToken}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Dashboardprovider>(context, listen: false)
          .getDashBoardData(widget.loginToken);
    });
    super.initState();
  }

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
      body: Consumer<Dashboardprovider>(
        builder: (context, dashBoardProvider, child) {
          if (dashBoardProvider.dashBoardResponas == null) {
            // Show a loading state or an empty state when data is not available
            return Center(child: CircularProgressIndicator());
          }

          // Access the Dashboardmodel data
          Dashboardmodel dashboardData = dashBoardProvider.dashBoardResponas!;
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
                        height: 25,
                      ),
                      headingandsubheadwidget(
                        heading: "Dashboard",
                        subheading: "",
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      _buildDashboardItems(
                        title: 'Total Products',
                        totalcount: dashboardData.totalproduct,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDashboardItems(
                        title: 'totalcategory',
                        totalcount: dashboardData.totalcategory,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDashboardItems(
                        title: 'totalorder',
                        totalcount: dashboardData.totalorder,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDashboardItems(
                        title: 'activeorder',
                        totalcount: dashboardData.activeorder,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDashboardItems(
                        title: 'completeorder',
                        totalcount: dashboardData.completeorder,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _buildDashboardItems extends StatelessWidget {
  final String? title;
  final int? totalcount;
  const _buildDashboardItems({
    super.key,
    required this.title,
    required this.totalcount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: ListTile(
          leading: Text(
            "$title",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            "$totalcount",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
