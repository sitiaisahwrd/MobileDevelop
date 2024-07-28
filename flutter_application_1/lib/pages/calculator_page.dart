import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';
  String _selectedOperation = '+';

  void _calculate() {
    final String firstNumber = _firstNumberController.text;
    final String secondNumber = _secondNumberController.text;

    if (firstNumber.isEmpty || secondNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan dua angka')),
      );
      return;
    }

    final double num1 = double.parse(firstNumber);
    final double num2 = double.parse(secondNumber);
    double calcResult;

    switch (_selectedOperation) {
      case '+':
        calcResult = num1 + num2;
        break;
      case '-':
        calcResult = num1 - num2;
        break;
      case '*':
        calcResult = num1 * num2;
        break;
      case '/':
        calcResult = num1 / num2;
        break;
      default:
        calcResult = 0;
    }

    setState(() {
      _result = calcResult.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Kalkulator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka pertama',
              ),
            ),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka kedua',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOperationButton('+'),
                _buildOperationButton('-'),
                _buildOperationButton('*'),
                _buildOperationButton('/'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Hasil'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationButton(String operation) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedOperation = operation;
        });
      },
      child: Text(operation),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _selectedOperation == operation ? Colors.blue : Colors.grey,
      ),
    );
  }
}
