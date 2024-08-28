import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading1;
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;
  final Color backgroundColor;
  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.white,
    required this.automaticallyImplyLeading1,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        automaticallyImplyLeading:
            automaticallyImplyLeading1 == true ? true : false,
        leading: automaticallyImplyLeading1 == true
            ? leading ??
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
            : null,
        title: title,
        actions: [
          IconButton(
            onPressed: () {
              print("go to notification");
              Navigator.pushNamed(context, '/notification');
            },
            icon: Image.asset('assets/images/notificationicon.png'),
          )
        ],
      ),
    );
  }
}
