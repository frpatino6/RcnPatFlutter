// To parse this JSON data, do
//
//     final loginInfoModel = loginInfoModelFromJson(jsonString);

import 'dart:convert';

LoginInfoModel loginInfoModelFromJson(String str) => LoginInfoModel.fromJson(json.decode(str));

String loginInfoModelToJson(LoginInfoModel data) => json.encode(data.toJson());

class LoginInfoModel {
    String id;
    String name;
    String userName;
    String roleId;
    String roleName;
    String adminTypeElementId;

    LoginInfoModel({
        this.id,
        this.name,
        this.userName,
        this.roleId,
        this.roleName,
        this.adminTypeElementId,
    });

    factory LoginInfoModel.fromJson(Map<String, dynamic> json) => LoginInfoModel(
        id: json["id"],
        name: json["name"],
        userName: json["userName"],
        roleId: json["roleId"],
        roleName: json["roleName"],
        adminTypeElementId: json["adminTypeElementId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "userName": userName,
        "roleId": roleId,
        "roleName": roleName,
        "adminTypeElementId": adminTypeElementId,
    };
}
