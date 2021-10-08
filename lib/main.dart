import 'package:flutter/material.dart';
import 'package:flutter_shoes_app/src/models/botones_model.dart';
import 'package:flutter_shoes_app/src/models/zapato_model.dart';

import 'package:flutter_shoes_app/src/pages/zapato_page.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ZapatoModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => BotonesModel(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes App',
        home: ZapatoPage());
  }
}
