import 'package:flutter/material.dart';

class DosenPage2 extends StatefulWidget {
  const DosenPage2({super.key});

  @override
  State<DosenPage2> createState() => _DosenPage2State();
}

class _DosenPage2State extends State<DosenPage2> {
  List<Map<String, dynamic>> dosenList = [
    {
      "nama": "CZ",
      "email": "cz@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.rKjUTCis-Rki-TM6hyQfGAHaEK?rs=1&pid=ImgDetMain",
    },
    {
      "nama": "Justin Sun",
      "email": "justin@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.K1VLazPXHZaBMvUJuyCkUAHaE8?rs=1&pid=ImgDetMain",
    },
    {
      "nama": "Keanu Reves",
      "email": "keanu@gmail.com",
      "img":
          "https://images.hellomagazine.com/horizon/square/821036cf20cd-keanu-reeves.jpg",
    },
    {
      "nama": "Elon Musk",
      "email": "elon@gmail.com",
      "img":
          "https://th.bing.com/th/id/R.7f74cdafb3416c87fcf605e66f4c12fd?rik=20zeF75LZuhQ7Q&riu=http%3a%2f%2fwww.thefamouspeople.com%2fprofiles%2fimages%2felon-musk-1.jpg&ehk=bGWEbcsdoxqEEwaNuveQSXmdQ1%2b%2bOFWRbnwdiGtgLoM%3d&risl=&pid=ImgRaw&r=0",
    },
    {
      "nama": "Emma Stone",
      "email": "ema@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.Nu9qWtIeXMVp6pLdS4CV1gHaE8?rs=1&pid=ImgDetMain",
    },
    {
      "nama": "Ben Zhao",
      "email": "Ben@gmail.com",
      "img":
          "https://th.bing.com/th/id/OIP.c1aSzzUBFTEmzOWdYFLLVwHaD4?w=299&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    },
  ];
  String alamatGambar =
      "https://th.bing.com/th/id/OIP.rKjUTCis-Rki-TM6hyQfGAHaEK?rs=1&pid=ImgDetMain";
  String namaDosen = "CZ";
  String emailDosen = "cz@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Praktikum 5 Mapping")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(alamatGambar),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.green,
                  child: Text(namaDosen, style: TextStyle(fontSize: 20)),
                ),
                Container(
                  color: Colors.green,
                  child: Text(emailDosen, style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children:
                  dosenList
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              namaDosen = e["nama"];
                              emailDosen = e["email"];
                              alamatGambar = e["img"];
                            });
                          },
                          child: KotakDosen(
                            nama: e["nama"],
                            email: e["email"],
                            foto: e["img"],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class KotakDosen extends StatelessWidget {
  final String nama;
  final String email;
  final String foto;
  const KotakDosen({
    super.key,
    required this.nama,
    required this.email,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(foto), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            nama,
            style: TextStyle(
              fontSize: 8,
              color: Colors.amber,
              backgroundColor: Colors.grey,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 8,
              color: Colors.amber,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
