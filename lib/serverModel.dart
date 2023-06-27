import 'dart:convert';

ServerConnectionModel serverConnectionModelFromJson(String str) =>
    ServerConnectionModel.fromJson(json.decode(str));

String serverConnectionModelToJson(ServerConnectionModel data) =>
    json.encode(data.toJson());

class ServerConnectionModel {
  String status;
  String message;

  ServerConnectionModel({
    required this.status,
    required this.message,
  });

  factory ServerConnectionModel.fromJson(Map<String, dynamic> json) =>
      ServerConnectionModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
