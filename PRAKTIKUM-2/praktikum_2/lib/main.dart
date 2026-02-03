import 'package:flutter/material.dart';

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
  TextEditingController kodeBarangController = TextEditingController();
  TextEditingController jumlahBarangController = TextEditingController();
  TextEditingController caraBeliController = TextEditingController();

  String namaBarang = "";
  double hargaBarang = 0, totalHarga = 0, totalBayar = 0, diskon = 0;

  List hasilLoop = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conditional")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green,
                child: ListView(
                  children: [
                    TextField(
                      controller: kodeBarangController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("KODE BARANG"),
                      ),
                    ),
                    TextField(
                      controller: jumlahBarangController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("JUMLAH BARANG"),
                      ),
                    ),
                    TextField(
                      controller: caraBeliController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("CARA BELI"),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                switch (kodeBarangController.text
                                    .toString()
                                    .toUpperCase()) {
                                  case 'SPT':
                                    namaBarang = "SEPATU";
                                    hargaBarang = 100000;
                                    break;
                                  case 'SDL':
                                    namaBarang = "SENDAL";
                                    hargaBarang = 50000;
                                  case 'TOP':
                                    namaBarang = "TOPI";
                                    hargaBarang = 25000;
                                  case 'TST':
                                    namaBarang = "T-SHIRT";
                                    hargaBarang = 10000;
                                  default:
                                    namaBarang = "";
                                    hargaBarang = 0;
                                }
                                totalHarga =
                                    hargaBarang *
                                    double.parse(jumlahBarangController.text);

                                if (caraBeliController.text
                                        .toString()
                                        .toUpperCase() ==
                                    "COD") {
                                  diskon = 10 / 100 * totalHarga;
                                } else {
                                  diskon = 0;
                                }

                                totalBayar = totalHarga - diskon;
                              });
                            },
                            child: Text("PROSES"),
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
                                totalBayar = 0;
                                hargaBarang = 0;
                                totalHarga = 0;
                                diskon = 0;
                              });
                            },
                            child: Text("CLEAR"),
                          ),
                        ),
                      ],
                    ),
                    Text("NAMA BARANG : $namaBarang"),
                    Text("HARGA BARANG : $hargaBarang"),
                    Text("TOTAL HARGA : $totalHarga"),
                    Text("DISKON : $diskon"),
                    Text("TOTALBAYAR : $totalBayar"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasilLoop.clear();
                        for (var i = 0; i < 10; i++) {
                          hasilLoop.add(i);
                        }
                      });
                    },
                    child: Text("FOR LOOP"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasilLoop.clear();
                        var i = 0;
                        while (i < 10) {
                          hasilLoop.add(i);
                          i += 2;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("WHILE LOOP"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasilLoop.clear();
                        List<String> listWarna = [
                          "Merah",
                          "Hijau",
                          "Kuning",
                          "Biru",
                        ];

                        for (var warna in listWarna) {
                          hasilLoop.add(
                            warna.toString().contains("a") ? warna : "-",
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.amber,
                    ),
                    child: Text("FOR EACH IN"),
                  ),
                  Text("HASIL LOOPING: $hasilLoop"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
