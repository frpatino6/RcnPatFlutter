
import 'package:flutter/material.dart';
import 'package:rcn_pat_conductores/models/service_info_model.dart';
import 'package:rcn_pat_conductores/providers/service_info_provider.dart';

class ListServices extends StatefulWidget {
  ListServices({Key key}) : super(key: key);

  @override
  _ListServicesState createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  ServiceInfoProvider serviceInfoProvider = new ServiceInfoProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text('Servicios disponibles',
              style: TextStyle(color: Colors.white)),
        ),
        body: _crearListado());
  }

  Widget _cardServiceList(BuildContext context, ServiceInfoModel infoModel) {
    return Card(
      elevation: 50,
      margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              onTap: () {},
              leading: Icon(Icons.phone),
              title: Text('${infoModel.celularSolicitante.toString()}')),
          ListTile(
            leading: Icon(Icons.timer),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('${infoModel.fechaInicial}'),
          ),
          ListTile(
            leading: Icon(Icons.timer_off),
            title: Text('${infoModel.fechaFinal}'),
          ),
        ],
      ),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: serviceInfoProvider.fetchServices(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ServiceInfoModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) =>
                _cardServiceList(context, snapshot.data[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
