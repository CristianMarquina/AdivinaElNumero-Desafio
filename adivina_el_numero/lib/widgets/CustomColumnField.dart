import 'package:adivina_el_numero/utils/size_utils.dart';
import 'package:flutter/material.dart';
class CustomColumnField extends StatelessWidget {
  final String topText;
  final double height;
  final List<Guess> guesses;

  CustomColumnField({required this.topText, required this.height,required this.guesses,});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFF303030),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 2),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                topText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: guesses.length,
                itemBuilder: (context, index) {
                  final guess = guesses[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      guess.number.toString(),
                      style: TextStyle(color: guess.color, fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Guess {
  int number;
  String result;
  Color color;
  Guess(this.number, this.result, this.color);
}