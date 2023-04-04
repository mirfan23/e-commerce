import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model2.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

@HiveType(typeId: 2)
class UserModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String fullName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? image;
  @HiveField(4)
  DateTime? birthday;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.image,
    this.birthday,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        fullName: data['fullName'],
        email: data['email'],
        image: data['image'] == null ? null : data['image']['url'],
        birthday: data['image'] == null
            ? null
            : DateTime.parse(
                data['age'],
              ),
      );
}
