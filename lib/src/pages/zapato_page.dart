import 'package:flutter/material.dart';
import 'package:flutter_shoes_app/src/helpers/helpers.dart';
import 'package:flutter_shoes_app/src/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return Scaffold(
      // body: CustomAppBar(texto: 'For You')
      body: Column(
        children: [
          const CustomAppBar(texto: 'For You'),
          const SizedBox(height: 20.0),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                    tag: 'zpato-1',
                    child: ZapatoSizePreview()),
                   ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          const AgregarCarritoBoton(
            monto: 180.0,
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
