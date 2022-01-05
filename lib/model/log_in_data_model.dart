import 'package:flutter/cupertino.dart';

class LogInDataModel with ChangeNotifier{
  String? message;
  String? token;
  Data? data;

  LogInDataModel({this.message, this.token, this.data});

  fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    // var list = json['data'] as List;
    // print(list.runtimeType);
    // data = list.map((i) => Data.fromJson(i)).toList();
    notifyListeners();
  }

  get _data{
    return data;
  }
  get _token{
    return token;
  }
  get _message{
    return message;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['message'] = this.message;
  //   data['token'] = this.token;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? providerId;
  String? avatar;
  String? phone;
  String? lastSeen;
  String? emailVerifiedAt;
  String? currentTeamId;
  String? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  Data(
      {this.id,
      this.name,
      this.email,
      this.providerId,
      this.avatar,
      this.phone,
      this.lastSeen,
      this.emailVerifiedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      providerId: json['provider_id'],
      avatar: json['avatar'],
      phone: json['phone'],
      lastSeen: json['last_seen'],
      emailVerifiedAt: json['email_verified_at'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['provider_id'] = this.providerId;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    data['last_seen'] = this.lastSeen;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
