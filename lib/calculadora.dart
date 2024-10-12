import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    int num1 = int.tryParse(_num1Controller.text) ?? 0;
    int num2 = int.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          _result = 'Resultado: ${num1 + num2}';
          break;
        case '-':
          _result = 'Resultado: ${num1 - num2}';
          break;
        case '*':
          _result = 'Resultado: ${num1 * num2}';
          break;
        case '/':
          if (num2 != 0) {
            double result = num1 / num2;
            if (result == result.truncate()) {
              _result = 'Resultado: ${result.toInt()}';
            } else {
              _result = 'Resultado: ${result.toStringAsFixed(2)}';
            }
          } else {
            _result = 'No se puede dividir por cero :(';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Básica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calculate('+'), child: Text('+')),
                ElevatedButton(onPressed: () => _calculate('-'), child: Text('-')),
                ElevatedButton(onPressed: () => _calculate('*'), child: Text('*')),
                ElevatedButton(onPressed: () => _calculate('/'), child: Text('/')),
              ],
            ),
            SizedBox(height: 32),
            Text(
              _result,
              style: Theme.of(context).textTheme.headlineSmall, // Cambiado de headline6 a headlineSmall
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}

