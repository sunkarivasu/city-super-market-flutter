import 'package:city_super_market/main.dart';
import 'package:city_super_market/screens/login.dart';
import 'package:city_super_market/screens/orders.dart';
import 'package:flutter/material.dart';
import "package:city_super_market/constants.dart";
import "package:city_super_market/globals.dart" as globals;

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return globals.User.getCurrentUser()['user'] != null
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
            // color: appBarColor,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      globals.User.getCurrentUser()['user']['name'],
                      style: const TextStyle(
                          // color: Colors.white,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      globals.User.getCurrentUser()['user']['emailId'],
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const Divider(
                    // color: homePageBackgroundColor,
                    ),
                const SizedBox(
                  height: 10,
                ),
                // SizedBox(height: 5,),
                const DrawerOptionIcon(
                  icon: Icons.shopping_cart,
                  option: "My Cart",
                ),
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
            // color: appBarColor,
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                          globals.User.setPageNumber(0);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => MyStatefullWidget()),
                              (route) => false);
                          //     .pushAndRemoveUntil(
                          // context,
                          // MaterialPageRoute(
                          //     builder: (context) => MyStatefullWidget()),
                          // (route) => false);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: appBarColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5)),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const Divider(
                      // color: homePageBackgroundColor,
                      ),
                ]),
          );
  }
}

class DrawerOptionIcon extends StatelessWidget {
  const DrawerOptionIcon({super.key, required this.icon, required this.option});

  final IconData icon;
  final String option;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (option == "My Cart") {
          globals.User.setPageNumber(1);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyStatefullWidget()));
        } else if (option == "My Orders") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OrdersPage()));
          // Navigator.pop(context);
        } else if (option == "Log out") {
          globals.User.setCurrerntUser({
            "user": null,
          });
          globals.User.setPageNumber(0);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyStatefullWidget()),
              (route) => false);
        }
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: Colors.black54,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            option,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
