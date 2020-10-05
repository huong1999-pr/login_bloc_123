// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  int code;
  Data data;
  List<Message> message;
  bool success;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "success": success,
  };
}

class Data {
  Data({
    this.userInfo,
  });

  List<UserInfo> userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: List<UserInfo>.from(json["userInfo"].map((x) => UserInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userInfo": List<dynamic>.from(userInfo.map((x) => x.toJson())),
  };
}

class UserInfo {
  UserInfo({
    this.authToken,
    this.displayName,
    this.id,
    this.roleNoId,
  });

  String authToken;
  String displayName;
  String id;
  int roleNoId;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    authToken: json["auth_token"],
    displayName: json["displayName"],
    id: json["id"],
    roleNoId: json["roleNoId"],
  );

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
    "displayName": displayName,
    "id": id,
    "roleNoId": roleNoId,
  };
}

class Message {
  Message({
    this.code,
    this.message,
  });

  int code;
  dynamic message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}