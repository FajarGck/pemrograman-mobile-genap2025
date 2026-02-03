import 'package:flutter/material.dart';

List<String> bahasaDipilihList = [];

class Kemampuanbahasa extends StatefulWidget {
  const Kemampuanbahasa({super.key});

  @override
  State<Kemampuanbahasa> createState() => _KemampuanbahasaState();
}

class _KemampuanbahasaState extends State<Kemampuanbahasa> {
  List<String> bahasaList = [
    "Indonesia",
    "Inggris",
    "Jawa",
    "Sunda",
    "Batak",
    "Madura",
    "Jepang",
    "Korea",
    "Mandarin",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kemampuan Berbahasa"),
        SizedBox(
          height: 90,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 1,
            ),
            children: bahasaList.map((e) => OpsiBahasa(strBahasa: e)).toList(),
          ),
        ),
      ],
    );
  }
}

class OpsiBahasa extends StatefulWidget {
  final String strBahasa;
  const OpsiBahasa({super.key, required this.strBahasa});

  @override
  State<OpsiBahasa> createState() => _OpsiBahasaState();
}

class _OpsiBahasaState extends State<OpsiBahasa> {
  bool? opsiDipilih = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: opsiDipilih,
          onChanged: (value) {
            setState(() {
              opsiDipilih = value;
              if (value == true) {
                bahasaDipilihList.add(widget.strBahasa);
              } else {
                bahasaDipilihList.remove(widget.strBahasa);
              }
            });
          },
        ),
        Text(widget.strBahasa),
      ],
    );
  }
}
