import 'package:flutter/material.dart';
import 'package:remidi/keranjang.dart';
import 'package:remidi/profile.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(), debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text("Homepage")]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            panggilHalaman(value);
            // value = _currentIndex;
          });
        },
        selectedItemColor: Colors.red[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
      ),
    );
  }

  void panggilHalaman(int value) {
    if (value == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } else if (value == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Keranjang()),
      );
    }
  }
}
