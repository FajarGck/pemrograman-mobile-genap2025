import 'package:flutter/material.dart';

class LatihanConditional extends StatefulWidget {
  const LatihanConditional({super.key});

  @override
  State<LatihanConditional> createState() => _LatihanConditionalState();
}

class _LatihanConditionalState extends State<LatihanConditional> {
  TextEditingController kodeBarangController = TextEditingController();
  TextEditingController jumlahBarangController = TextEditingController();
  TextEditingController caraBeliController = TextEditingController();

  String namaBarang = "";
  double hargaBarang = 0, totalHarga = 0, diskon = 0, totalBayar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Conditional"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 16, bottom: 2),
        child: Wrap(
          runSpacing: 10,
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
                label: Text("Jumlah Barang"),
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
                        switch (kodeBarangController.text.toUpperCase()) {
                          case "SPT":
                            namaBarang = "Sepatu 👟";
                            hargaBarang = 200000;
                            break;
                          case "SDL":
                            namaBarang = "Sendal 🩴";
                            hargaBarang = 100000;
                            break;
                          case "TST":
                            namaBarang = "T-Shirt 👕";
                            hargaBarang = 250000;
                            break;
                          case "TOP":
                            namaBarang = "Topi Cowboy 🤠";
                            hargaBarang = 50000;
                            break;
                          default:
                            namaBarang = "Kode Tidak Ditemukan😀";
                        }
                        totalHarga =
                            hargaBarang *
                            double.parse(jumlahBarangController.text);
                        if (caraBeliController.text.toUpperCase() == "COD") {
                          diskon = 10 / 100 * totalHarga;
                        } else {
                          diskon = 0;
                        }

                        totalBayar = totalHarga - diskon;
                      });
                    },
                    child: Text("Proses"),
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
                    child: Text("Reset"),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Barang   : $namaBarang"),
                Text("Harga Barang    : $hargaBarang"),
                Text("Total Harga       : $totalHarga"),
                Text("Diskon              : $diskon"),
                Text("Total Bayar     : $totalBayar"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
