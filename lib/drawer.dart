import 'package:flutter/material.dart';

import 'drawer_navigation.dart';

class HomeDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int index, DrawerNavigationItem item)? onStateChanged;

  const HomeDrawer({
    Key? key,
    this.currentIndex = 0,
    this.onStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerNavigation(
      header: DrawerNavigationHeader(
        title: "Chatty",
        titleColor: Colors.white,
        titleStyle: FontWeight.bold,
        image: const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 120,
        ),
        background: Theme.of(context).primaryColor,
      ),
      action: DrawerNavigationAction(
        selectedIndex: currentIndex,
        borderRadius: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        iconPadding: const EdgeInsets.only(
          right: 16,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyleState: (state) {
          if (state == ButtonState.selected) {
            return FontWeight.bold;
          } else {
            return FontWeight.normal;
          }
        },
        colorState: (state) {
          if (state == ButtonState.selected) {
            return Colors.white;
          } else {
            return Theme.of(context).primaryColor.withOpacity(0.5);
          }
        },
        backgroundState: (state) {
          if (state == ButtonState.selected) {
            return Theme.of(context).primaryColor;
          } else {
            return Colors.transparent;
          }
        },
        items: const [
          DrawerNavigationItem(
            key: "home",
            title: "Home",
            icon: StateValue(
              activeValue: Icons.home,
              inactiveValue: Icons.home_outlined,
            ),
          ),
          DrawerNavigationItem(
            key: "profile",
            title: "Profile",
            icon: StateValue(
              activeValue: Icons.person,
              inactiveValue: Icons.person_outline,
            ),
          ),
          DrawerNavigationItem(
            key: "logout",
            title: "Logout",
            icon: StateValue(
              activeValue: Icons.exit_to_app,
              inactiveValue: Icons.exit_to_app_outlined,
            ),
          ),
        ],
        onPressed: onStateChanged,
      ),
    );
  }
}
