import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum_6/agama.dart';
import 'package:praktikum_6/dataPendaftaran.dart';
import 'package:praktikum_6/jamDaftar.dart';
import 'package:praktikum_6/kemampuanBahasa.dart';
import 'package:praktikum_6/konstanta.dart';
import 'package:praktikum_6/model.dart';
import 'package:praktikum_6/tanggalDaftar.dart';

class MyHomePage extends StatefulWidget {
  final Pendaftaran? pendaftaran;
  const MyHomePage({super.key, this.pendaftaran});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  String? jenisKelamin;

  @override
  void initState() {
    super.initState();
    if (widget.pendaftaran != null) {
      namaController.text = widget.pendaftaran!.nama ?? '';
      emailController.text = widget.pendaftaran!.email ?? '';
      noTelpController.text = widget.pendaftaran!.noTelpon ?? '';
      jenisKelamin = widget.pendaftaran!.jenisKelamin ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latihan Formulir")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(label: Text("Nama Lengkap")),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              controller: noTelpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(label: Text("Nomor Telpon")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Pria"),
                    value: "Pria",
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text("Wanita"),
                    value: "Wanita",
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Kemampuanbahasa(),
            Agama(),
            Tanggaldaftar(),
            Jamdaftar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Pendaftaran dataPendaftaran = Pendaftaran(
                      id: widget.pendaftaran?.id,
                      nama: namaController.text,
                      email: emailController.text,
                      noTelpon: noTelpController.text,
                      jenisKelamin: jenisKelamin.toString(),
                      bahasa: bahasaDipilihList.toString(),
                      agama: agamaDipilih.toString(),
                      tanggalDaftar: tanggalDaftarDaftarController.text,
                      jamDaftar: jamDaftarDaftarController.text,
                    );
                    http.Response respons;
                    if (widget.pendaftaran == null) {
                      var url = Uri.parse(baseUrl + 'pendaftaran');
                      respons = await http.post(
                        url,
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(dataPendaftaran.toJson()),
                      );
                    } else {
                      var url = Uri.parse(
                        baseUrl + 'pendaftaran/${dataPendaftaran.id}',
                      );
                      respons = await http.put(
                        url,
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(dataPendaftaran.toJson()),
                      );
                    }

                    if (respons.statusCode == 200 ||
                        respons.statusCode == 201) {
                      if (widget.pendaftaran == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Datapendaftaran(),
                          ),
                        );
                      } else {
                        Navigator.pop(context, true);
                      }
                    } else {
                      Map<String, dynamic> responsDecode =
                          jsonDecode(respons.body) as Map<String, dynamic>;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            responsDecode['messages'].toString().replaceAll(
                              ",",
                              "\n\n",
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Simpan"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Datapendaftaran(),
                      ),
                    );
                  },
                  child: Text("Lihat Data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
