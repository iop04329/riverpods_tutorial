import 'package:flutter/foundation.dart';

class fakeAccount {
  int id;
  String name;
  String phone;
  String mail;
  String account;
  String password;
  fakeAccount(this.id, this.name, this.phone, this.mail, this.account, this.password);
  factory fakeAccount.fromJson(Map<String, dynamic> json) {
    return fakeAccount(
      json['id'],
      json['name'],
      json['phone'],
      json['mail'],
      json['account'],
      json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'mail': mail,
      'account': account,
      'password': password,
    };
  }
}
