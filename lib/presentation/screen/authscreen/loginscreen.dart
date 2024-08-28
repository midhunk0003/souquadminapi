import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({Key? key}) : super(key: key);

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage("assets/images/loginbg.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            // this containet is Opacity container
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: isTablet
                    ? const EdgeInsets.only(left: 70, right: 70)
                    : EdgeInsets.only(left: 25, right: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login with your registered\nUsername & Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 40 : 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Efficiently manage grocery orders seamlessly.",
                        style: TextStyle(
                            color: Colors.grey, fontSize: isTablet ? 20 : 13),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UserName",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isTablet ? 20 : 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              filled:
                                  true, // Set to true to apply the background color
                              fillColor: Colors.white,
                              hintText: "Username",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter username";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 54,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isTablet ? 20 : 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              filled:
                                  true, // Set to true to apply the background color
                              fillColor: Colors.white,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter password";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 80,
                      ),

                      // loginbutton

                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (_userNameController.text == "admin" &&
                                _passwordController.text == "123456") {
                              Navigator.pushNamed(context, '/homeScreen');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      const Color.fromARGB(169, 244, 67, 54),
                                  behavior: SnackBarBehavior
                                      .floating, // Allows the margin to be applied
                                  margin: EdgeInsets.all(16.0),
                                  content: Text("Invalid username or password"),
                                ),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: isTablet
                                ? const EdgeInsets.all(16.0)
                                : const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
