import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BotonNaranja extends StatelessWidget {
  final String titulo;
  final double alto;
  final double ancho;
  final Color color;

  const BotonNaranja({
    Key? key,
    required this.titulo,
    this.alto = 50.0,
    this.ancho = 150.0,
    this.color = const Color(0xfff1a23a),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: ancho,
        height: alto,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(
          titulo,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
