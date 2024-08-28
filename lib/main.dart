import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendorsouqjumla/presentation/provider/homescreenProvider.dart';
import 'package:vendorsouqjumla/presentation/provider/ordersummaryprovider.dart';
import 'package:vendorsouqjumla/presentation/screen/authscreen/loginscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/categoryscreen/addnewcategory.dart';
import 'package:vendorsouqjumla/presentation/screen/categoryscreen/categoryscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/categoryscreen/defaultcategory.dart';
import 'package:vendorsouqjumla/presentation/screen/categoryscreen/editcategory.dart';
import 'package:vendorsouqjumla/presentation/screen/categoryscreen/editcategoryanddelete.dart';
import 'package:vendorsouqjumla/presentation/screen/dashboardscreen/dashboardscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/homescreen/homescreen.dart';
import 'package:vendorsouqjumla/presentation/screen/notificationscreen/notificationscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/offerscreen/activeorinactive.dart';
import 'package:vendorsouqjumla/presentation/screen/offerscreen/addnewoffers.dart';
import 'package:vendorsouqjumla/presentation/screen/offerscreen/offerscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/onboardscreen/onbordScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/orderscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/activeorderscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/activeordersummaryscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/neworderscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/totalorderscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/viewordersummary.dart';
import 'package:vendorsouqjumla/presentation/screen/orderscreen/subscreens/viewtotalordersummary.dart';
import 'package:vendorsouqjumla/presentation/screen/productscreen/addnewdefaultproductscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/productscreen/addnewproductscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/productscreen/editanddeleteproductscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/productscreen/editproductscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/productscreen/productscreen.dart';
import 'package:vendorsouqjumla/presentation/screen/stockscreen/editstockshow.dart';
import 'package:vendorsouqjumla/presentation/screen/stockscreen/editstockview.dart';
import 'package:vendorsouqjumla/presentation/screen/stockscreen/stockscreen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Homescreenprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Ordersummaryprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'vendor Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => OnbordScreen(),
              );
            case '/loginPage':
              return _createRoute(
                Loginscreen(),
              );

            case '/homeScreen':
              return _createRoute(
                Homescreen(),
              );
            case '/orders':
              return _createRoute(
                Orderscreen(),
              );
            case '/neworders':
              return _createRoute(
                Neworderscreen(),
              );
            case '/viewordersummary':
              return _createRoute(
                Viewordersummary(),
              );
            case '/totalorders':
              return _createRoute(
                Totalorderscreen(),
              );

            case '/viewtotalordersummary':
              return _createRoute(
                ViewTotalordersummary(),
              );
            case '/activeorders':
              return _createRoute(
                ActiveOrderScreen(),
              );
            case '/activeordersummary':
              return _createRoute(
                ActiveOrderSummaryScreen(),
              );
            case '/notification':
              return _createRoute(
                Notificationscreen(),
              );
            case '/offers':
              return _createRoute(
                Offerscreen(),
              );
            case '/addnewoffer':
              return _createRoute(
                Addnewoffers(),
              );
            case '/activeorinactive':
              return _createRoute(
                ActiveOrInActiveUpdate(),
              );
            case '/dashboard':
              return _createRoute(
                Dashboardscreen(),
              );
            case '/category':
              return _createRoute(
                Categoryscreen(),
              );
            case '/addnewcategory':
              return _createRoute(
                Addnewcategory(),
              );
            case '/addnewdefaultcategory':
              return _createRoute(
                Defaultcategory(),
              );
            case '/editCategoryanddelete':
              return _createRoute(
                EditCategoryAndDelete(),
              );
            case '/editCategory':
              return _createRoute(
                EditCategory(),
              );

            case '/products':
              return _createRoute(
                ProductScreen(),
              );
            case '/addnewproduct':
              return _createRoute(
                AddnewProductscreen(),
              );
            case '/addnewdefaultproduct':
              return _createRoute(
                DefaultProduct(),
              );
            case '/editproductanddelete':
              return _createRoute(
                EditProductAndDelete(),
              );

            case '/editProduct':
              return _createRoute(
                EditProduct(),
              );

            case '/stocks':
              return _createRoute(
                StockScreen(),
              );

            case '/editstockshow':
              return _createRoute(
                EditStockShow(),
              );

            case '/editstockview':
              return _createRoute(
                Editstockview(),
              );
            default:
            // return MaterialPageRoute(builder: (context) => NotFoundScreen());
          }
          return null;
        },
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
