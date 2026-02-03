import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController jarijariLingkaranController = TextEditingController();
  TextEditingController luasLingkaranController = TextEditingController();
  TextEditingController kelilingLingkaranController = TextEditingController();

  TextEditingController jarijariTabungController = TextEditingController();
  TextEditingController tinggiTabungController = TextEditingController();
  TextEditingController volumetabungController = TextEditingController();
  TextEditingController LuasSelimutTabungController = TextEditingController();
  TextEditingController LuasPermukaanTabungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Latihan OOP")),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Rumus Lingkaran"),
                    TextField(
                      controller: jarijariLingkaranController,
                      decoration: InputDecoration(
                        label: Text("Jari - jari Lingkaran"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (jarijariLingkaranController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Jari Jari Lingkaran Harus diisi",
                                  ),
                                ),
                              );
                              return;
                            }
                            double jariJari = double.parse(
                              jarijariLingkaranController.text,
                            );
                            Lingkaran lingkaran = Lingkaran(jariJari);
                            luasLingkaranController.text =
                                lingkaran.getLuasLingkaran().toString();
                            kelilingLingkaranController.text =
                                lingkaran.getKelilingLingkaran().toString();
                          });
                        },
                        child: Text("Proses"),
                      ),
                    ),
                    TextField(
                      controller: luasLingkaranController,
                      decoration: InputDecoration(
                        label: Text("Luas Lingkaran"),
                      ),
                    ),
                    TextField(
                      controller: kelilingLingkaranController,
                      decoration: InputDecoration(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Rumus Tabung"),
                    TextField(
                      controller: jarijariTabungController,
                      decoration: InputDecoration(
                        label: Text("Jari - jari Tabung"),
                      ),
                    ),
                    TextField(
                      controller: tinggiTabungController,
                      decoration: InputDecoration(label: Text("TInggi Tabung")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Proses"),
                      ),
                    ),
                    TextField(
                      controller: volumetabungController,
                      decoration: InputDecoration(label: Text("Volume Tabung")),
                    ),
                    TextField(
                      controller: LuasSelimutTabungController,
                      decoration: InputDecoration(
                        label: Text("Luas Selimut Tabung"),
                      ),
                    ),
                    TextField(
                      controller: LuasPermukaanTabungController,
                      decoration: InputDecoration(
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

  double? get getJariJari {
    return _jariJari;
  }

  set setJariJari(jariJari) {
    _jariJari = jariJari;
  }

  double getLuasLingkaran() {
    return 22 / 7 * _jariJari! * _jariJari!;
  }

  double getKelilingLingkaran() {
    return 2 * 22 / 7 * _jariJari!;
  }
}
