import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayText = '0';
  double? _firstNumber;
  String? _operator;
  bool _shouldClear = false;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _displayText = '0';
        _firstNumber = null;
        _operator = null;
        _shouldClear = false;
      } else if (value == '+' || value == '-' || value == '×' || value == '/') {
        _firstNumber = double.tryParse(_displayText);
        _operator = value;
        _shouldClear = true;
      } else if (value == '=') {
        if (_firstNumber != null && _operator != null) {
          double secondNumber = double.tryParse(_displayText) ?? 0;
          switch (_operator) {
            case '+':
              _displayText = (_firstNumber! + secondNumber).toString();
              break;
            case '-':
              _displayText = (_firstNumber! - secondNumber).toString();
              break;
            case '×':
              _displayText = (_firstNumber! * secondNumber).toString();
              break;
            case '/':
              _displayText = secondNumber == 0 ? 'Error' : (_firstNumber! / secondNumber).toString();
              break;
          }
        }
        _firstNumber = null;
        _operator = null;
        _shouldClear = true;
      } else {
        if (_shouldClear) {
          _displayText = value;
          _shouldClear = false;
        } else {
          _displayText = _displayText == '0' ? value : _displayText + value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => _onButtonPressed('C'),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: Text(
                  _displayText,
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                ),
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
                _buildButton('0'), _buildButton('C'), _buildButton('='), _buildButton('+'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
