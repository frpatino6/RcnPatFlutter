// To parse this JSON data, do
//
//     final serviceInfoModel = serviceInfoModelFromJson(jsonString);

import 'dart:convert';

ServiceInfoModel serviceInfoModelFromJson(String str) => ServiceInfoModel.fromJson(json.decode(str));

String serviceInfoModelToJson(ServiceInfoModel data) => json.encode(data.toJson());

class ServiceInfoModel {
    int id;
    String solicitudNombre;
    DateTime fechaInicial;
    DateTime fechaFinal;
    String nombreUsuarioSolicitante;
    String celularSolicitante;
    String descripcionRecorrido;
    dynamic observaciones;
    String nombreTipoVehiculoProgramado;
    String nombreModalidadServicio;
    String nombreProveedor;
    String placa;
    String nombreConductor;
    String celularConductor;

    ServiceInfoModel({
        this.id,
        this.solicitudNombre,
        this.fechaInicial,
        this.fechaFinal,
        this.nombreUsuarioSolicitante,
        this.celularSolicitante,
        this.descripcionRecorrido,
        this.observaciones,
        this.nombreTipoVehiculoProgramado,
        this.nombreModalidadServicio,
        this.nombreProveedor,
        this.placa,
        this.nombreConductor,
        this.celularConductor,
    });

    factory ServiceInfoModel.fromJson(Map<String, dynamic> json) => ServiceInfoModel(
        id: json["Id"],
        solicitudNombre: json["SolicitudNombre"],
        fechaInicial: DateTime.parse(json["FechaInicial"]),
        fechaFinal: DateTime.parse(json["FechaFinal"]),
        nombreUsuarioSolicitante: json["NombreUsuarioSolicitante"],
        celularSolicitante: json["CelularSolicitante"],
        descripcionRecorrido: json["DescripcionRecorrido"],
        observaciones: json["Observaciones"],
        nombreTipoVehiculoProgramado: json["NombreTipoVehiculoProgramado"],
        nombreModalidadServicio: json["NombreModalidadServicio"],
        nombreProveedor: json["NombreProveedor"],
        placa: json["Placa"],
        nombreConductor: json["NombreConductor"],
        celularConductor: json["CelularConductor"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "SolicitudNombre": solicitudNombre,
        "FechaInicial": fechaInicial.toIso8601String(),
        "FechaFinal": fechaFinal.toIso8601String(),
        "NombreUsuarioSolicitante": nombreUsuarioSolicitante,
        "CelularSolicitante": celularSolicitante,
        "DescripcionRecorrido": descripcionRecorrido,
        "Observaciones": observaciones,
        "NombreTipoVehiculoProgramado": nombreTipoVehiculoProgramado,
        "NombreModalidadServicio": nombreModalidadServicio,
        "NombreProveedor": nombreProveedor,
        "Placa": placa,
        "NombreConductor": nombreConductor,
        "CelularConductor": celularConductor,
    };
}
