import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final datajson = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(datajson);
    opciones = dataMap['rutas'];
    return opciones;
  }

  
}

final menuProvider = new _MenuProvider();
