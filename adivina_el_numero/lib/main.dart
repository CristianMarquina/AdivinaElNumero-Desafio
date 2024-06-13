import 'package:adivina_el_numero/utils/size_utils.dart';
import 'package:adivina_el_numero/widgets/CustomTextFormField.dart';
import 'package:adivina_el_numero/widgets/CustomColumnField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _sliderValue = 0;
  // Método para obtener la etiqueta basada en el valor del slider
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
                  controller: TextEditingController(),
                  alignment: Alignment.topCenter,
                  margin: getMargin(left: 15, top: 30, right: 25, bottom: 10),
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
                        '5',
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
                  ),
                  CustomColumnField(
                    topText: 'Menor Que',
                    height: 250,
                  ),
                  CustomColumnField(
                    topText: 'Historial',
                    height: 250,
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
                      setState(() {
                        _sliderValue = value;
                      });
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
