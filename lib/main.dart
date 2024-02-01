import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CalculatorApp",
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
      debugShowCheckedModeBanner: false,
      home: const CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {

    TextEditingController firstNumberController = TextEditingController();
    TextEditingController secondNumberController = TextEditingController();
    TextEditingController resultController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "CalculatorApp",
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             TextField(
              controller: firstNumberController,
              decoration: const InputDecoration(
                labelText: 'Enter First Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20,),

             TextField(
              controller: secondNumberController,
              decoration: const InputDecoration(
                labelText: 'Enter Second Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20,),

             TextField(
              controller: resultController,
              enabled: false,
              decoration: const InputDecoration(
                labelText: 'Result',fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Row(
              children: [

                ElevatedButton(onPressed: () {

                  var result = int.parse(firstNumberController.text) + int.parse(secondNumberController.text);
                  resultController.text = "$result";




                }, child: const Text("ADD")) ,

                const SizedBox(width: 10,),

                ElevatedButton(onPressed: () {
                  var result = int.parse(firstNumberController.text) - int.parse(secondNumberController.text);
                  resultController.text = "$result";

                }, child: const Text("SUB")) ,

                const SizedBox(width: 10,),

                ElevatedButton(onPressed: () {
                  var result = int.parse(firstNumberController.text) * int.parse(secondNumberController.text);
                  resultController.text = "$result";

                }, child: const Text("MUL")) ,

                const SizedBox(width: 10,),

                ElevatedButton(onPressed: () {

                  var result = double.parse(firstNumberController.text) / double.parse(secondNumberController.text);
                  resultController.text = "$result";

                }, child: const Text("DIV")) ,

              ],
            ),

            Container(

              width: double.infinity,

              child: ElevatedButton(onPressed: (){
                firstNumberController.text = "";
                secondNumberController.text = "";
                resultController.text = "";
              },child: Text("CLEAR"),),
            )




          ],
        ),
      ),
    );
  }
}
