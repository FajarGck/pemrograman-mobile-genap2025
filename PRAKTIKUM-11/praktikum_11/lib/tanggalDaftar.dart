import 'package:flutter/material.dart';

TextEditingController tanggalDaftarDaftarController = TextEditingController();

class Tanggaldaftar extends StatefulWidget {
  const Tanggaldaftar({super.key});

  @override
  State<Tanggaldaftar> createState() => _TanggaldaftarState();
}

class _TanggaldaftarState extends State<Tanggaldaftar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tanggalDaftarDaftarController,
      decoration: InputDecoration(
        label: Text("Tanggal Daftar"),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              pilihTanggal();
            });
          },
          icon: Icon(Icons.date_range),
        ),
      ),
    );
  }

  Future<void> pilihTanggal() async {
    DateTime? tglDidapat;

    tglDidapat = await showDatePicker(
      context: context,
      firstDate: DateTime(2025),
      lastDate: DateTime(2050),
    );

    if (tglDidapat.toString() != "null") {
      tanggalDaftarDaftarController.text = tglDidapat.toString().substring(
        0,
        10,
      );
    }
  }
}
