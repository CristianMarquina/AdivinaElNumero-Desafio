import 'package:adivina_el_numero/utils/size_utils.dart';
import 'package:flutter/material.dart';
class CustomColumnField extends StatelessWidget {
  final String topText;
  final double height;

  CustomColumnField({required this.topText, required this.height});

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
        margin: getMargin(right: 5,left: 5),
        child: SingleChildScrollView(
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
              // Añade más widgets aquí si es necesario
            ],
          ),
        ),
      ),
    );
  }
}