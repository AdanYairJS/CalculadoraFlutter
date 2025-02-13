import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Agrega margen
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                border: Border.all(color: Colors.black, width: 1.5), // Borde sutil
              ),
              child: const Text(
                '0',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: [
                _buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('/'),
                _buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×'),
                _buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-'),
                _buildButton('0'), _buildButton('.'), _buildButton('+/-'), _buildButton('+'),
                _buildButton('='),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, {Color color = Colors.grey}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: color,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}