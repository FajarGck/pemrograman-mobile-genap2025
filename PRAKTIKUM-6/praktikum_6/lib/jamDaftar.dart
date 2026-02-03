// ignore_for_file: file_names

import 'package:flutter/material.dart';

TextEditingController jamDaftarDaftarController = TextEditingController();

class Jamdaftar extends StatefulWidget {
  const Jamdaftar({super.key});

  @override
  State<Jamdaftar> createState() => _JamdaftarState();
}

class _JamdaftarState extends State<Jamdaftar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: jamDaftarDaftarController,
      decoration: InputDecoration(
        label: Text("Jam Daftar"),
        suffix: IconButton(
          onPressed: () {
            pilihTanggal();
          },
          icon: Icon(Icons.timer),
        ),
      ),
    );
  }

  Future<void> pilihTanggal() async {
    TimeOfDay? tglDidapat;
    tglDidapat = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (tglDidapat.toString() != "null") {
      jamDaftarDaftarController.text = tglDidapat
          .toString()
          .replaceAll('TimeOfDay(', '')
          .replaceAll(')', '');
    }
  }
}
