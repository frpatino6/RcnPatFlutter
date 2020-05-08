import 'package:flutter/material.dart';
import 'package:rcn_pat_conductores/pages/list_services.dart';
import 'package:rcn_pat_conductores/pages/login_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'listServices': (BuildContext context) => ListServices(),
  };
}
