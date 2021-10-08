import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shoes_app/src/models/zapato_model.dart';
import 'package:flutter_shoes_app/src/pages/zapato_desc_page.dart';
import 'package:provider/provider.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({
    Key? key,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5.0 : 30.0,
          vertical: (fullScreen) ? 5.0 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 405 : 430.0,
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: (fullScreen)
                ? const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  )
                : BorderRadius.circular(50.0),
          ),
          child: Column(
            children: [
              // Zapato con sombras
              const _ZapatoConSombra(),
    
              // Tallas
              if (!fullScreen) const _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCuadro(7.0),
          _TallaZapatoCuadro(7.5),
          _TallaZapatoCuadro(8.0),
          _TallaZapatoCuadro(8.5),
          _TallaZapatoCuadro(9.0),
          _TallaZapatoCuadro(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCuadro extends StatelessWidget {
  final double talla;

  const _TallaZapatoCuadro(
    this.talla,
  );

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = talla; 

      },
      child: Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: (talla == zapatoModel.talla) ? const Color(0xfff1a23a) : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                if (talla == zapatoModel.talla)
                  const BoxShadow(
                      color: Color(0xfff1a23a),
                      blurRadius: 10,
                      offset: Offset(0, 5))
              ]),
          child: Text(
            talla.toString().replaceAll('.0', ''),
            style: TextStyle(
                color: (talla == zapatoModel.talla) ? Colors.white : const Color(0xfff1a23a),
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children:  [
          const Positioned(
            bottom: 20.0,
            right: 0,
            child: _ZapatoSombra(),
          ),
          Image(image: AssetImage(zapatoModel.assetImage))
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffeaa14e),
                blurRadius: 40.0,
              )
            ]),
      ),
    );
  }
}
