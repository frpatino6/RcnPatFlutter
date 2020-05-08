import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rcn_pat_conductores/models/login_info_model.dart';

class LoginInfoProvider {


  Future<List<LoginInfoModel>> fetchLogin() async {
    List<LoginInfoModel> result = new List();

    final response = await http.get(
        'http://portalterceros.rcntv.com.co/API_Transportes/api/ScheduleByDriver?NoDocumento=79844438');

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      dynamic dataMap = json.decode(response.body);

      if (dataMap == null) return [];

      dataMap.forEach((value) {
        final loginInfoTemp = LoginInfoModel.fromJson(value);
        result.add(loginInfoTemp);
      });
      return result;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load login');
    }
  }
  
}

final loginInfoProvider = new LoginInfoProvider();
