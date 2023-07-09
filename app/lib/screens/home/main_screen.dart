import 'package:app/screens/home/chat_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/home/profile_screen.dart';
import 'package:app/screens/home/wishlist_screen.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          "assets/cart_icon.png",
          width: 20,
        ),
      );
    }

    Widget customButtomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              print(value);
              setState(() {
                currentIndex = value;
              });
            },
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "assets/home_icon.png",
                    width: 20,
                    color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "assets/chat_icon.png",
                    width: 21,
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "assets/wishlist_icon.png",
                    width: 20,
                    color: currentIndex == 2 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "assets/profile_icon.png",
                    width: 18,
                    color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: "",
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomeScreen();
        case 1:
          return ChatScreen();
        case 2:
          return WishlistScreen();
        case 3:
          return ProfileScreen();
        default:
          return HomeScreen();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtomNav(),
      body: body(),
    );
  }
}
