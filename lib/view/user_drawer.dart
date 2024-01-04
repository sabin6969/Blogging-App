import 'package:flutter/material.dart';
import 'package:mvc_app/constants/constants.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Drawer(
      width: size.width * 0.7,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              FirebaseConstants.firebaseAuth.currentUser!.email ??
                  "user@gmail.com",
            ),
            accountEmail: /*Text(
              FirebaseConstants.firebaseAuth.currentUser!.displayName ??
                  "Username",
            ),*/
                null,
          ),
          ListTile(
            onTap: () {},
            title: const Text("Settings"),
            leading: const Icon(
              Icons.settings,
            ),
            subtitle: const Text("Change settings"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.person,
            ),
            title: const Text("Profile"),
            subtitle: const Text("View your profile"),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            onTap: () {},
            title: const Text("Logout"),
            subtitle: const Text("Logout from this device"),
          )
        ],
      ),
    );
  }
}
