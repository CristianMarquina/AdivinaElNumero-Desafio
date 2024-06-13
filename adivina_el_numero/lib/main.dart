import 'package:adivina_el_numero/utils/funtions_utils.dart';
import 'package:adivina_el_numero/utils/size_utils.dart';
import 'package:adivina_el_numero/widgets/CustomTextFormField.dart';
import 'package:adivina_el_numero/widgets/CustomColumnField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (context) => MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int _secretNumber;
  late int _attempts;
  late int _remainingAttempts;
  late int _maxInput ;
  String _difficultyLevel = 'Fácil';
  List<Guess> _guesses = [];
  List<Guess> _historial = [];
  bool _gameOver = false;
  double _sliderValue = 0;
  TextEditingController _inputNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      switch (_difficultyLevel) {
        case 'Fácil':
          _secretNumber = generateRandomNumber(10);
          _attempts = 5;
          _maxInput = 10;
          break;
        case 'Medio':
          _secretNumber = generateRandomNumber(20);
          _attempts = 8;
          _maxInput = 20;
          break;
        case 'Avanzado':
          _secretNumber = generateRandomNumber(100);
          _attempts = 15;
          _maxInput = 100;
          break;
        case 'Extremo':
          _secretNumber = generateRandomNumber(1000);
          _attempts = 25;
          _maxInput = 1000;
          break;
      }
      _remainingAttempts = _attempts;
      _guesses.clear();
      print("número secreto");
      print(_secretNumber);
      _gameOver = false;
      _inputNumber.clear();
    });
  }

  void _submitNumber() {
    final guess = int.tryParse(_inputNumber.text);
    print("buenoooooo");
    print(_maxInput);
    if (guess == null || guess < 1 || guess > _maxInput) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error de validación'),
          content: guess == 0? Text('El número no puede ser 0'):Text('El número debe ser menor a '+_maxInput.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
      return;
    }
    setState(() {
      if (guess == _secretNumber) {
        _historial.add(Guess(guess, 'correct', Colors.green));
        _gameOver = true;
      } else if (guess != _secretNumber && _remainingAttempts == 1) {
        _historial.add(Guess(guess, 'incorrect', Colors.red));
      } else if (guess > _secretNumber) {
        _guesses.add(Guess(guess, 'Mayor Que', Colors.red));
      } else {
        _guesses.add(Guess(guess, 'Menor Que', Colors.red));
      }
      _remainingAttempts--;

      if (_remainingAttempts == 0 && !_gameOver) {
        _gameOver = true;
      }
    });

    _inputNumber.clear();
    if (_gameOver) {
      _resetGame();
      return;
    }
  }

  void _changeDifficulty(double sliderValue) {
    setState(() {
      _sliderValue = sliderValue;
      _difficultyLevel = getLevel(sliderValue);
      _resetGame();
    });
  }

  String getLevel(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Fácil';
      case 1:
        return 'Medio';
      case 2:
        return 'Avanzado';
      case 3:
        return 'Extremo';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Adivina el número')),
          backgroundColor: Color(0xFF424242),
        ),
        backgroundColor: Color(0xFF303030),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  hintText: 'Numbers',
                  width: 200,
                  height: 50,
                  controller: _inputNumber,
                  alignment: Alignment.topCenter,
                  margin: getMargin(left: 15, top: 30, right: 25, bottom: 10),
                  onSubmit: _submitNumber,
                ),
                SizedBox(width: 20),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Intentos',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '$_remainingAttempts',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 330,
              child: Row(
                children: [
                  CustomColumnField(
                    topText: 'Mayor Que',
                    height: 250,
                    guesses:
                        _guesses.where((g) => g.result == 'Menor Que').toList(),
                  ),
                  CustomColumnField(
                    topText: 'Menor Que',
                    height: 250,
                    guesses:
                        _guesses.where((g) => g.result == 'Mayor Que').toList(),
                  ),
                  CustomColumnField(
                    topText: 'Historial',
                    height: 250,
                    guesses: _historial
                        
                  ),
                ],
              ),
            ),
            // Tercer Row: Slider en la parte inferior
            Container(
              padding: getPadding(bottom: 0, right: 25, left: 25),
              child: Column(
                children: [
                  Text(
                    getLevel(_sliderValue),
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 3,
                    divisions: 3,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.withOpacity(0.3),
                    onChanged: (value) {
                      _changeDifficulty(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
