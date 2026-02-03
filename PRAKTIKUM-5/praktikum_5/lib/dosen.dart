import 'package:flutter/material.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({super.key});

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {
  String imgUrl =
      "https://th.bing.com/th/id/OIP.dTOz82Vu78PkuZ-t5GJ41gHaJ4?w=135&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7";

  List<String> images = [
    "https://th.bing.com/th/id/OIP.dTOz82Vu78PkuZ-t5GJ41gHaJ4?w=135&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://images.hellomagazine.com/horizon/square/821036cf20cd-keanu-reeves.jpg",
    "https://th.bing.com/th/id/R.7f74cdafb3416c87fcf605e66f4c12fd?rik=20zeF75LZuhQ7Q&riu=http%3a%2f%2fwww.thefamouspeople.com%2fprofiles%2fimages%2felon-musk-1.jpg&ehk=bGWEbcsdoxqEEwaNuveQSXmdQ1%2b%2bOFWRbnwdiGtgLoM%3d&risl=&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/OIP.c1aSzzUBFTEmzOWdYFLLVwHaD4?w=299&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.rKjUTCis-Rki-TM6hyQfGAHaEK?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.K1VLazPXHZaBMvUJuyCkUAHaE8?rs=1&pid=ImgDetMain",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dosen")),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      imgUrl = images[index];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
