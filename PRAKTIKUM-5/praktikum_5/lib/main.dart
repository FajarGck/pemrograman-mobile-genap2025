import 'package:flutter/material.dart';
import 'package:praktikum_5/dosen.dart';
import 'package:praktikum_5/dosen2.dart';
import 'package:praktikum_5/mahasiswa.dart';
import 'package:praktikum_5/matakuliah.dart';
import 'package:praktikum_5/nilai.dart';

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
  List<Map<String, dynamic>> navBar = [
    {'widget': Icons.home, 'title': 'Home'},
    {'widget': Icons.person, 'title': 'Dosen'},
    {'widget': Icons.person, 'title': 'Dosen2'},
    {'widget': Icons.people, 'title': 'Mahasiswa'},
    {'widget': Icons.subject, 'title': 'Matakuliah'},
    {'widget': Icons.score, 'title': 'Nilai Akhir'},
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BottomNavigation bar dan Navigation",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("oleh: Fajar Ramadhan"),
            Image.asset("assets/img/logo-amikom.png"),
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
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items:
            navBar
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e['widget']),
                    label: e['title'],
                  ),
                )
                .toList(),
      ),
    );
  }

  void panggilHalaman(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DosenPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DosenPage2()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MahasiswaPage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MataKuliahPage()),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NilaiPage()),
      );
    }
  }
}
