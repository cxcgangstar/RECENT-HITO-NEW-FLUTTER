import 'package:flutter/material.dart';

class OverviewSidebar extends StatelessWidget {
  const OverviewSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 👤 USER PROFILE
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 163, 122, 233),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('widgets/assets/hito.png'),
            ),
            accountName: const Text("Nicole Andrea"),
            accountEmail: const Text("nicole@email.com"),
          ),

          // 📊 DASHBOARD
          _drawerItem(
            icon: Icons.dashboard,
            title: "Dashboard",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _drawerItem(
            icon: Icons.info,
            title: "Parameters Info",
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          const Divider(),

          // 🚪 LOGOUT
          _drawerItem(
            icon: Icons.logout,
            title: "Logout",
            isLogout: true,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}