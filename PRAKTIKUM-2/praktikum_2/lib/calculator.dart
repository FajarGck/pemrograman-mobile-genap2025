import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController numController1 = TextEditingController();
  TextEditingController numController2 = TextEditingController();
  TextEditingController hasilController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latihan 2")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            TextField(
              controller: numController1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Number 1"),
              ),
            ),
            TextField(
              controller: numController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Number 2"),
              ),
            ),
            TextField(
              controller: hasilController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Hasil"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      aritmatic(operator: "+");
                    });
                  },
                  child: Text("TAMBAH"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      aritmatic(operator: "-");
                    });
                  },
                  child: Text("KURANG"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      aritmatic(operator: "*");
                    });
                  },
                  child: Text("KALI"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      aritmatic(operator: "/");
                    });
                  },
                  child: Text("BAGI"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void aritmatic({String? operator}) {
    double num1 = double.parse(numController1.text);
    double num2 = double.parse(numController2.text);
    double result = 0;
    if (operator == "+") {
      result = num1 + num2;
    } else if (operator == "-") {
      result = num1 - num2;
    } else if (operator == "/") {
      result = num1 / num2;
    } else if (operator == "*") {
      result = num1 * num2;
    }
    hasilController.text = result.toString();
  }
}
