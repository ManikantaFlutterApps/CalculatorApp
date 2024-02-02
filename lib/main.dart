import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberInputField("Enter First Number", firstNumberController, true),
            const SizedBox(
              height: 20,
            ),
            numberInputField(
                "Enter Second Number", secondNumberController, true),
            const SizedBox(
              height: 20,
            ),
            numberInputField("Result", resultController, false),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                myElevatedButton(firstNumberController, secondNumberController,
                    resultController, "ADD"),
                const SizedBox(
                  width: 10,
                ),
                myElevatedButton(firstNumberController, secondNumberController,
                    resultController, "SUB"),
                const SizedBox(
                  width: 10,
                ),
                myElevatedButton(firstNumberController, secondNumberController,
                    resultController, "MUL"),
                const SizedBox(
                  width: 10,
                ),
                myElevatedButton(firstNumberController, secondNumberController,
                    resultController, "DIV"),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: myElevatedButton(firstNumberController, secondNumberController,
                  resultController, "CLEAR"),
              ),
          ],
        ),
      ),
    );
  }
}

Widget numberInputField(String labelText,
    TextEditingController textEditingController, bool isEditable) {
  return TextField(
    enabled: isEditable,
    controller: textEditingController,
    decoration: InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 0.0),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

Widget myElevatedButton(
    TextEditingController firstNumberController,
    TextEditingController secondNumberController,
    TextEditingController resultController,
    String labelText) {
  return ElevatedButton(
      onPressed: () {
        var result = performArithmeticOperation(
            firstNumberController, secondNumberController, resultController,labelText);
        resultController.text = result;
      },
      child: Text(labelText));
}

String performArithmeticOperation(TextEditingController firstNumberController,
    TextEditingController secondNumberController, TextEditingController resultController,String labelText) {
  String result = "";

  switch (labelText) {
    case "ADD":

      var addResult = int.parse(firstNumberController.text) + int.parse(secondNumberController.text);
      result = addResult.toString();

      break;

    case "SUB":

      var subResult = int.parse(firstNumberController.text) - int.parse(secondNumberController.text);
      result = subResult.toString();

      break;

    case "MUL":

      var mulResult = int.parse(firstNumberController.text) * int.parse(secondNumberController.text);
      result = mulResult.toString();

      break;

    case "DIV":
      var divResult = double.parse(firstNumberController.text) + double.parse(secondNumberController.text);
      result = divResult.toString();
      break;
    case  "CLEAR" :

      firstNumberController.text = "";
      secondNumberController.text = "";
      resultController.text = "";

      break;

  }

  return result;
}
