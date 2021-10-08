import 'package:flutter/material.dart';
import 'package:flutter_shoes_app/src/helpers/helpers.dart';
import 'package:flutter_shoes_app/src/models/botones_model.dart';
import 'package:provider/provider.dart';

import 'package:animate_do/animate_do.dart';

import 'package:flutter_shoes_app/src/models/zapato_model.dart';
import 'package:flutter_shoes_app/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(fullScreen: true),
              ),
              Positioned(
                  top: 80.0,
                  left: 30.0,
                  child: IconButton(
                    onPressed: () {
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(monto: 180.0),
                  _ColoresYMas(),
                  _BotonLikeCartSettings(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonLikeCartSettings extends StatelessWidget {
  const _BotonLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: icon,
        width: 55.0,
        height: 55.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0,
                spreadRadius: -5,
                offset: Offset(0, 10))
          ],
        ),
      ),
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                    left: 90,
                    child: _BotonColor(
                        color: Color(0xffc6d642),
                        index: 4,
                        urlImage: 'assets/verde.png')),
                Positioned(
                    left: 60,
                    child: _BotonColor(
                        color: Color(0xffffad29),
                        index: 3,
                        urlImage: 'assets/amarillo.png')),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                      color: Color(0xff2099f1),
                      index: 2,
                      urlImage: 'assets/azul.png'),
                ),
                _BotonColor(
                    color: Color(0xff364d56),
                    index: 1,
                    urlImage: 'assets/negro.png'),
              ],
            ),
          ),
          // const Spacer(),
          const BotonNaranja(
            color: Color(0xffffc675),
            titulo: 'More related items',
            ancho: 170,
            alto: 30,
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImage;

  const _BotonColor({
    Key? key,
    required this.color,
    required this.index,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImage;
        },
        child: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  final double monto;

  const _MontoBuyNow({
    Key? key,
    required this.monto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ $monto',
              style:
                  const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 10.0,
              child: const BotonNaranja(
                titulo: 'Buy Now',
                alto: 40.0,
                ancho: 120.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
