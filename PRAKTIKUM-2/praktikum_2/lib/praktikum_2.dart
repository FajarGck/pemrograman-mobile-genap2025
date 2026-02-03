import 'package:flutter/material.dart';

class Latihan2 extends StatefulWidget {
  const Latihan2({super.key});

  @override
  State<Latihan2> createState() => _Latihan2State();
}

class _Latihan2State extends State<Latihan2> {
  TextEditingController kodeBarangController = TextEditingController();
  TextEditingController jumlahBarangController = TextEditingController();
  TextEditingController caraBeliController = TextEditingController();
  String namaBarang = "";
  double hargaBarang = 0, totalHarga = 0, diskon = 0, totalBayar = 0;
  List<String> hasilLooping = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan 2"),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.tealAccent,
                child: ListView(
                  children: [
                    TextField(
                      controller: kodeBarangController,
                      decoration: InputDecoration(
                        label: Text("Kode Barang"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: jumlahBarangController,
                      decoration: InputDecoration(
                        label: Text("Jumlah barang"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: caraBeliController,
                      decoration: InputDecoration(
                        label: Text("Cara Beli"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                String kodeBarang = kodeBarangController.text;
                                double jumlahBarang = double.parse(
                                  jumlahBarangController.text,
                                );
                                String caraBeli =
                                    caraBeliController.text.toUpperCase();

                                switch (kodeBarang.toString().toUpperCase()) {
                                  case "SPT":
                                    namaBarang = "Sepatu";
                                    hargaBarang = 200000;
                                    break;
                                  case "SDL":
                                    namaBarang = "Sendal";
                                    hargaBarang = 100000;
                                    break;
                                  case "TST":
                                    namaBarang = "T-Sthirt";
                                    hargaBarang = 250000;
                                    break;
                                  case "TOP":
                                    namaBarang = "Topi Cowboy🤠";
                                    hargaBarang = 50000;
                                    break;
                                  default:
                                    namaBarang = "-";
                                    hargaBarang = 0;
                                }

                                totalHarga = hargaBarang * jumlahBarang;

                                if (caraBeli == "COD") {
                                  diskon = 10 / 100 * totalHarga;
                                } else {
                                  diskon = 0;
                                }

                                totalBayar = totalHarga - diskon;
                              });
                            },
                            child: Text("Prosess"),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                kodeBarangController.clear();
                                jumlahBarangController.clear();
                                caraBeliController.clear();
                                namaBarang = "";
                                hargaBarang = 0;
                                totalHarga = 0;
                                diskon = 0;
                                totalBayar = 0;
                              });
                            },
                            child: Text("Clear"),
                          ),
                        ),
                      ],
                    ),
                    Text("Nama Barang : $namaBarang"),
                    Text("Harga Barang : $hargaBarang"),
                    Text("Total Harga : $totalHarga"),
                    Text("Diskon : $diskon"),
                    Text("Total Bayar : $totalBayar"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        hasilLooping.clear();
                        for (var i = 0; i < 100; i++) {
                          hasilLooping.add(i.toString());
                        }
                        setState(() {});
                      },
                      child: Text("Looping dengan For"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hasilLooping.clear();
                          int num = 1;
                          while (num < 100) {
                            hasilLooping.add(num.toString());
                            num += 5;
                          }
                        });
                      },
                      child: Text("Looping dengan While Loop"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hasilLooping.clear();
                          List<String> warna = [
                            "Merah",
                            "Kuning",
                            "Hijau",
                            "Biru",
                            "Ungu",
                          ];
                          for (var element in warna) {
                            hasilLooping.add(
                              (element.toString().contains("a"))
                                  ? element
                                  : "-",
                            );
                          }
                        });
                      },
                      child: Text("Looping dengan For In"),
                    ),
                    Text("Hasil Looping : \n $hasilLooping"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
