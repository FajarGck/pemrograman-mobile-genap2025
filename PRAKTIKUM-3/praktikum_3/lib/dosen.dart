import 'package:flutter/material.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({super.key});

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {
  String imageUrl =
      'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain';
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
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                GestureDetector(
                  onTap:
                      () => setState(() {
                        imageUrl =
                            'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain';
                      }),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain',
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => setState(() {
                        imageUrl =
                            'https://stylecaster.com/wp-content/uploads/2017/06/emma-stone-platinum-blonde.jpg?resize=768';
                      }),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://stylecaster.com/wp-content/uploads/2017/06/emma-stone-platinum-blonde.jpg?resize=768',
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => setState(() {
                        imageUrl =
                            'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain';
                      }),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain',
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => setState(() {
                        imageUrl =
                            'https://stylecaster.com/wp-content/uploads/2017/06/emma-stone-platinum-blonde.jpg?resize=768';
                      }),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://stylecaster.com/wp-content/uploads/2017/06/emma-stone-platinum-blonde.jpg?resize=768',
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => setState(() {
                        imageUrl =
                            'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain';
                      }),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.RENI_0YtaT59s3uqXiQCmAHaE8?rs=1&pid=ImgDetMain',
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => setState(() {
                        imageUrl =
                            'https://stylecaster.com/wp-content/uploads/2017/06/emma-stone-platinum-blonde.jpg?resize=768';
                      }),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://stylecaster.com/wp-content/uploads/2017/06/emma-stone-platinum-blonde.jpg?resize=768',
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
