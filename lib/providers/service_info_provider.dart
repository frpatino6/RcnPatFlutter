import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rcn_pat_conductores/models/service_info_model.dart';

class ServiceInfoProvider {
  Future<List<ServiceInfoModel>> fetchServices() async {
    List<ServiceInfoModel> result = new List();

    final response = await http.get(
        'http://portalterceros.rcntv.com.co/API_Transportes/api/ScheduleByDriver?NoDocumento=79844438');

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      dynamic dataMap = json.decode(response.body);

      if (dataMap == null) return [];

      dataMap.forEach((value) {
        final serviceInfoTemp = ServiceInfoModel.fromJson(value);
        result.add(serviceInfoTemp);
      });
      return result;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}

final serviceInfoProvider = new ServiceInfoProvider();
