import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(
      json.decode(str).map(UserModel.fromJson) as List<UserModel>,
    );

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? email,
    String? photoUrl,
    double? latitude,
    double? longitude,
    String? displayName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
