// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:praktikum_6/konstanta.dart';
import 'package:praktikum_6/model.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum_6/my_home_page.dart';

class Datapendaftaran extends StatefulWidget {
  const Datapendaftaran({super.key});

  @override
  State<Datapendaftaran> createState() => _DatapendaftaranState();
}

class _DatapendaftaranState extends State<Datapendaftaran> {
  List<Pendaftaran> pendaftaranList = [];

  Future ambilDataPendaftaran() async {
    var url = Uri.parse(baseUrl + 'pendaftaran');
    var respons = await http.get(url);

    List responsDecode = jsonDecode(respons.body);
    pendaftaranList.clear();
    for (var element in responsDecode) {
      pendaftaranList.add(Pendaftaran.fromJson(element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Pendaftaran")),
      body: FutureBuilder(
        future: ambilDataPendaftaran(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (pendaftaranList.length == 0) {
              return Center(child: Text("Data tidak ditemukan"));
            }
          }
          return ListView.builder(
            itemCount: pendaftaranList.length,
            itemBuilder:
                (context, index) => Card(
                  child: ListTile(
                    title: Text(pendaftaranList[index].nama!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pendaftaranList[index].email!),
                        Text(pendaftaranList[index].noTelpon!),
                        Text(pendaftaranList[index].jenisKelamin!),
                        Text(pendaftaranList[index].bahasa!),
                        Text(pendaftaranList[index].agama!),
                        Text(pendaftaranList[index].tanggalDaftar!),
                        Text(pendaftaranList[index].jamDaftar!),
                      ],
                    ),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => MyHomePage(
                                        pendaftaran: pendaftaranList[index],
                                      ),
                                ),
                              );
                              if (result == true) {
                                setState(() {
                                  ambilDataPendaftaran();
                                });
                              }
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              hapusData(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }

  void hapusData(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Hapus Data"),
            content: Text(
              "Apakah anda yakin ingin menghapus data ${pendaftaranList[index].nama}?",
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    var url = Uri.parse(
                      baseUrl + 'pendaftaran/${pendaftaranList[index].id!}',
                    );
                    var respons = http.delete(url);
                    Navigator.pop(context);
                  });
                },
                child: Text("Ya"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Text("Tidak"),
              ),
            ],
          ),
    );
  }
}
