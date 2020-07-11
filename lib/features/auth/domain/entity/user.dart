import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable{
  final String email;
  final String uid;
  final String displayName;
  final String profileUrl;

  User({@required this.email,@required this.uid,@required this.displayName, this.profileUrl});

  @override
  List<Object> get props => [email,uid,displayName,profileUrl];


}
