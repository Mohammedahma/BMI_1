import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berat Badan Ideal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IdealWeightCalculator(),
    );
  }
}

class IdealWeightCalculator extends StatefulWidget {
  @override
  _IdealWeightCalculatorState createState() => _IdealWeightCalculatorState();
}

class _IdealWeightCalculatorState extends State<IdealWeightCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _result = '';

  void _calculateIdealWeight() {
    final double height = double.tryParse(_heightController.text) ?? 0.0;
    final double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      final double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        if (bmi < 18.5) {
          _result = 'Berat badan kurang';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          _result = 'Berat badan ideal';
        } else if (bmi >= 25 && bmi < 29.9) {
          _result = 'Berat badan berlebih';
        } else {
          _result = 'Obesitas';
        }
      });
    } else {
      setState(() {
        _result = 'Masukkan nilai tinggi dan berat yang valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Berat Badan Ideal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi badan (cm)',
              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat badan (kg)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateIdealWeight,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
