import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(), debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController jariJariLingkaranController = TextEditingController();
  TextEditingController luasLingkaranController = TextEditingController();
  TextEditingController kelilingLingkaranController = TextEditingController();

  TextEditingController jariJariTabungController = TextEditingController();
  TextEditingController tinggiTabungController = TextEditingController();
  TextEditingController volumeTabungController = TextEditingController();
  TextEditingController luasSelimutTabungController = TextEditingController();
  TextEditingController luasPermukaanTabungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Praktikum 4 OOP🧭")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.width,
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Rumus Lingkaran 🔴"),
                    TextField(
                      controller: jariJariLingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Jari Jari Lingkaran"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          luasLingkaranController.clear();
                          kelilingLingkaranController.clear();
                          if (jariJariLingkaranController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Jari jari Lingkarang tidak boleh kosong",
                                ),
                              ),
                            );
                            return;
                          }

                          double jariJari = double.parse(
                            jariJariLingkaranController.text,
                          );

                          Lingkaran lingkaran = Lingkaran(jariJari);
                          luasLingkaranController.text =
                              lingkaran.getLuasLingkaran().toString();
                          kelilingLingkaranController.text =
                              lingkaran.getKelilingLingkaran().toString();
                        });
                      },
                      child: Text("Prosess"),
                    ),
                    TextField(
                      controller: luasLingkaranController,
                      decoration: InputDecoration(
                        label: Text("Luas Lingkaran"),
                      ),
                    ),
                    TextField(
                      controller: kelilingLingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Keliling Lingkaran"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Rumus Tabung ⛽"),
                    TextField(
                      controller: jariJariTabungController,
                      decoration: const InputDecoration(
                        label: Text("Jari Jari Tabung"),
                      ),
                    ),
                    TextField(
                      controller: tinggiTabungController,
                      decoration: const InputDecoration(
                        label: Text("Tinggi Tabung"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          volumeTabungController.clear();
                          luasSelimutTabungController.clear();
                          luasPermukaanTabungController.clear();
                          if (jariJariTabungController.text.isEmpty ||
                              tinggiTabungController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Jari jari dan tinggi tabung harus diisi! 👿",
                                ),
                              ),
                            );
                            return;
                          }

                          double jariJariTabung = double.parse(
                            jariJariTabungController.text,
                          );
                          double tinggiTabung = double.parse(
                            tinggiTabungController.text,
                          );

                          Tabung tabung = Tabung(jariJariTabung, tinggiTabung);
                          volumeTabungController.text =
                              tabung.getVolumeTabung().toString();
                          luasSelimutTabungController.text =
                              tabung.getLuasSelimutTabung().toString();
                          luasPermukaanTabungController.text =
                              tabung.getLuasPermukaanTabung().toString();
                        });
                      },
                      child: Text("Prosses"),
                    ),
                    TextField(
                      controller: volumeTabungController,
                      decoration: const InputDecoration(
                        label: Text("Volume Tabung"),
                      ),
                    ),
                    TextField(
                      controller: luasSelimutTabungController,
                      decoration: const InputDecoration(
                        label: Text("Luas Selimut Tabung"),
                      ),
                    ),
                    TextField(
                      controller: luasPermukaanTabungController,
                      decoration: const InputDecoration(
                        label: Text("Luas Permukaan Tabung"),
                      ),
                    ),
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

class Lingkaran {
  double? _jariJari;
  Lingkaran([this._jariJari]);

  double? get getJariJari => _jariJari;

  set setJariJari(jariJari) {
    _jariJari = jariJari;
  }

  double getLuasLingkaran() {
    return 22 / 7 * _jariJari! * _jariJari!;
  }

  double getKelilingLingkaran() => 2 * 22 / 7 * _jariJari!;
}

class Tabung extends Lingkaran {
  double? _tinggi;
  Tabung([super._jariJari, this._tinggi]);

  double? get getTinggi => _tinggi;

  set setTinggi(tinggi) {
    _tinggi = tinggi;
  }

  double getVolumeTabung() => getLuasLingkaran() * _tinggi!;

  double getLuasSelimutTabung() => getKelilingLingkaran() * _tinggi!;

  double getLuasPermukaanTabung() =>
      getLuasSelimutTabung() + 2 * getLuasLingkaran();
}
