import 'package:ambios/components/my_appbar.dart';
import 'package:ambios/components/my_drawer.dart';
import 'package:ambios/components/my_container.dart';
import 'package:ambios/pages/sensor_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: 'Home'),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: [
            MyContainer(
              containerName: 'Sensors',
              logo: Icon(Icons.wifi_channel_sharp),
              logoPadding: const EdgeInsets.all(10),
              nextPage: const SensorPage(),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              margin: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
              textSize: 35,
            )
          ],
        ),
      ),
    );
  }
}