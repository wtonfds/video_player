import 'package:seventh_player/features/login/domain/entities/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginEntity {
  String? token;
  String? message;

  LoginModel({this.token, this.message}) : super(token, message);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
