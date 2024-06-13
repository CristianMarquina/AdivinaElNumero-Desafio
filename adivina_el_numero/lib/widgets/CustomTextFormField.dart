import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;
  final TextEditingController controller;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
    

  // Constructor del widget, que inicializa los parámetros requeridos
  CustomTextFormField({
    required this.hintText,
    required this.width,
    required this.height,
    required this.controller,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment, // Alinea el widget según el parámetro `alignment`
      child: Container(
        width: width, // Establece el ancho del contenedor según el parámetro `width`
        height: height, // Establece la altura del contenedor según el parámetro `height`
        padding: padding, // Aplica el padding al contenedor
        margin: margin, // Aplica el margin al contenedor
        child: TextFormField(
          controller: controller, // Controlador para manejar el texto del campo
          keyboardType: TextInputType.number, // Define el tipo de teclado como numérico
          style: TextStyle(color: Colors.white), // Estilo del texto dentro del campo, color blanco
          decoration: InputDecoration(
            hintText: hintText, // Texto de pista del campo de entrada
            hintStyle: TextStyle(color: Colors.white70), // Estilo del texto de pista, color blanco con opacidad
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Borde blanco cuando el campo está habilitado
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Borde blanco cuando el campo está enfocado
            ),
          ),
        ),
      ),
    );
  }
}