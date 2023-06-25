import 'package:city_super_market/constants.dart';
import 'package:city_super_market/screens/orders.dart';
import 'package:city_super_market/screens/productDetails.dart';
import 'package:city_super_market/screens/proudct_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/cart.dart';
import 'screens/account.dart';
import 'screens/login.dart';
import 'package:city_super_market/globals.dart' as globals;
import 'dart:convert';
import "arguments.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<User>(
      create: (context) => User(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "City Super Market",
        // home:MyStatefullWidget(),
        //   routes: {
        //     "/": (context) => MyStatefullWidget(),
        //     "/productDetails": (context) => ProductDetailsPage()
        // },
        onGenerateRoute: (settings) {
          if (settings.name == "/") {
            return MaterialPageRoute(builder: (context) {
              return const MyStatefullWidget();
            });
          } else if (settings.name == "/productDetails") {
            final args = settings.arguments as ProductDetailsArguments;
            return MaterialPageRoute(builder: (context) {
              return ProductDetailsPage(
                  productId: args.productId,
                  image: args.image,
                  brand: args.brand,
                  actualPrice: args.actualPrice,
                  mrp: args.mrp,
                  discount: args.mrp,
                  description: args.description);
            });
          }
          return null;
        },
      ),
    );
  }
}

class MyStatefullWidget extends StatefulWidget {
  const MyStatefullWidget({super.key});

  // var currentUser = null;

  // MyStatefullWidget({this.currentUser});

  @override
  State<MyStatefullWidget> createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  // int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomePage(),
    const ProductCategories(),
    const OrdersPage(),
    const AccountPage()
  ];

  List<String> appBarTitles = [
    "City Super Market",
    "Categories",
    "My Orders",
    "My Account"
  ];

  void _onTapped(index) {
    if (index <= 3) {
      setState(() {
        // _selectedIndex = index;
        globals.User.setPageNumber(index);
      });
    } else if (index == 3) {
      // FLAGGED: check if this code is ever called ?
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrdersPage()));
    } else if (index == 4) {
      setState(() {
        globals.User.setCurrerntUser({"user": null});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: globals.User.pageNumber == 0
          ? const Drawer(child: DrawerOptions())
          : null,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appBarTitles[globals.User.pageNumber]),
        backgroundColor: appBarColor,
      ),
      backgroundColor: homePageBackgroundColor,
      body: Center(child: _widgetOptions.elementAt(globals.User.pageNumber)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Categories",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
        currentIndex: globals.User.pageNumber,
        onTap: _onTapped,
        selectedItemColor: appBarColor,
      ),
    );
  }
}

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({super.key});

  // // var currentUser;
  // Function onTapped;

  // DrawerOptions({required this.currentUser,required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return globals.User.getCurrentUser()['user'] != null
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
            color: appBarColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      globals.User.getCurrentUser()['user']['name'],
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      globals.User.getCurrentUser()['user']['emailId'],
                      style:
                          const TextStyle(color: Colors.white38, fontSize: 15),
                    )
                  ],
                ),
                Divider(
                  color: homePageBackgroundColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const DrawerOptionIcon(
                    icon: Icons.account_circle, option: "My Account"),
                const SizedBox(
                  height: 5,
                ),
                const DrawerOptionIcon(
                    icon: Icons.shopping_cart, option: "My Cart"),
                const SizedBox(
                  height: 5,
                ),
                const DrawerOptionIcon(
                    icon: Icons.shopping_bag_outlined, option: "My Orders"),
                const SizedBox(
                  height: 5,
                ),
                const DrawerOptionIcon(icon: Icons.logout, option: "Log out"),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
            color: appBarColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Divider(
                color: homePageBackgroundColor,
              ),
            ]),
          );
  }
}

class DrawerOptionIcon extends StatelessWidget {
  final IconData icon;
  final String option;

  const DrawerOptionIcon({super.key, required this.icon, required this.option});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (option == "My Cart") {
          globals.User.setPageNumber(1);
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyStatefullWidget()));
          Navigator.pop(context);
        } else if (option == "My Account") {
          globals.User.setPageNumber(2);
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyStatefullWidget()));
          Navigator.pop(context);
          // Navigator.pop(context);
        } else if (option == "My Orders") {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OrdersPage()));
          Navigator.pop(context);
        } else if (option == "Log out") {
          globals.User.setCurrerntUser({"user": null});
          Navigator.pop(context);
        }
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: Colors.white70,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            option,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class User extends ChangeNotifier {
  var currentUser = jsonEncode(<String, dynamic>{"_id": null});

  void setCurrerntUser(Map<String, dynamic> user) {
    // var decodedUser = jsonDecode(user);
    currentUser = jsonEncode(<String, dynamic>{...user});

    print("global value set");
    print(currentUser);
    notifyListeners();
  }

  Map<String, dynamic> getCurrentUser() {
    return jsonDecode(currentUser);
  }
}
