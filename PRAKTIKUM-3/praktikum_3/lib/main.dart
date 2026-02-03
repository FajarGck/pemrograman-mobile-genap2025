import 'package:flutter/material.dart';
import 'package:praktikum_3/dosen.dart';
import 'package:praktikum_3/mahasiswa.dart';
import 'package:praktikum_3/matakuliah.dart';
import 'package:praktikum_3/nilai.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation bar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Oleh gue sendiri"),
            Image.asset('assets/gambar/logo-amikom.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          panggilHalaman(value);
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'dosen'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mahasiswa'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'matakuliah'),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: 'nilai',
          ),
        ],
      ),
    );
  }

  void panggilHalaman(index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DosenPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MahasiswaPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MataKuliahPage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NilaiPage()),
      );
    }
  }
}
