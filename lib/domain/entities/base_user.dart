import 'package:equatable/equatable.dart';

class BaseUser extends Equatable {
  String uID;

  String userName;
  String password;

  BaseUser({required this.uID, required this.userName, required this.password});

  @override
  List<Object?> get props => [uID, userName, password];
}
