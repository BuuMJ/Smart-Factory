import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_factory/components/SideMenu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: const Center(
            child: Text('Home'),
          )),
    );
  }
}
