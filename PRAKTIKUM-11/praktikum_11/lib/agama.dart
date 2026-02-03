import 'package:flutter/material.dart';

String? agamaDipilih;

class Agama extends StatefulWidget {
  const Agama({super.key});

  @override
  State<Agama> createState() => _AgamaState();
}

class _AgamaState extends State<Agama> {
  List<String> agamaList = [
    "Islam",
    "Kristen",
    "Katolik",
    "Hindu",
    "Budha",
    "ateis",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text("Silahkan Pilih Agama"),
      value: agamaDipilih,
      items:
          agamaList.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
      onChanged: (value) => setState(() => agamaDipilih = value),
    );
  }
}
