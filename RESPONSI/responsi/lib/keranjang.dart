import 'package:flutter/material.dart';
import 'package:responsi/data_source.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({super.key});

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Belanja"),
        backgroundColor: Colors.red[300],
        foregroundColor: Colors.white,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: daftarBelanjaList.length,

          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  daftarBelanjaList[index]['gambar'],
                                ),
                              ),
                            ),
                          ),
                          Text(daftarBelanjaList[index]['namamenu']),
                          Text(daftarBelanjaList[index]['harga'].toString()),
                          Text(daftarBelanjaList[index]['jmlitem'].toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
