import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String operation = '+';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'First number',
              ),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Second number',
              ),
            ),
            DropdownButton(
              value: operation,
              onChanged: (value) {
                setState(() {
                  operation = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: '+',
                  child: Text('+'),
                ),
                DropdownMenuItem(
                  value: '-',
                  child: Text('-'),
                ),
                DropdownMenuItem(
                  value: '*',
                  child: Text('*'),
                ),
                DropdownMenuItem(
                  value: '/',
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double num1 = double.parse(num1Controller.text);
                double num2 = double.parse(num2Controller.text);

                switch (operation) {
                  case '+':
                    result = num1 + num2;
                    break;
                  case '-':
                    result = num1 - num2;
                    break;
                  case '*':
                    result = num1 * num2;
                    break;
                  case '/':
                    result = num1 / num2;
                    break;
                }

                setState(() {});
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
