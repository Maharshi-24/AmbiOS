import 'package:ambios/components/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:ambios/components/my_drawer.dart'; // Import MyDrawer

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: 'Settings'),
      drawer: MyDrawer(), // Add the drawer
    );
  }
}