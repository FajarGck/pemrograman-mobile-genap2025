import 'package:flutter/material.dart';

class LatihanLooping extends StatefulWidget {
  const LatihanLooping({super.key});

  @override
  State<LatihanLooping> createState() => _LatihanLoopingState();
}

class _LatihanLoopingState extends State<LatihanLooping> {
  List hasilLooping = [];
  List<String> listWarna = [
    "Red 🔴",
    "Blue 🔵",
    "Green 🟢",
    "Yellow 🟡",
    "Black ⚫",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Looping"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 16,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasilLooping.clear();
                    for (var i = 0; i < 100; i++) {
                      hasilLooping.add(i);
                    }
                  });
                },
                child: Text("For Loop"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasilLooping.clear();
                    int i = 1;
                    while (i <= 10) {
                      hasilLooping.add(i);
                      i++;
                    }
                  });
                },
                child: Text("While Loop"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasilLooping.clear();
                    int x = 0;
                    do {
                      hasilLooping.add(x);
                      x += 2;
                    } while (x <= 20);
                  });
                },
                child: Text("Do While Loop"),
              ),
              ElevatedButton(
                onPressed: () {
                  hasilLooping.clear();
                  setState(() {
                    listWarna.forEach((warna) {
                      hasilLooping.add(warna);
                    });
                  });
                },
                child: Text("For Each"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasilLooping.clear();
                    for (var element in listWarna) {
                      hasilLooping.add(
                        (element.toString().contains("a")) ? element : "-",
                      );
                    }
                  });
                },
                child: Text("For In"),
              ),
              Text("Hasil Looping: \n $hasilLooping"),
            ],
          ),
        ),
      ),
    );
  }
}
