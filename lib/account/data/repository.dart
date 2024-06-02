import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/account/domain/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final accountRepoProvider = Provider<accountRepo>((ref) {
  return accountRepo();
});

//藍圖
abstract class repository<T> {
  login(String account, String password) {}
  register(Map<String, dynamic> data) {}
  edit(int id, T data) {}
  delete(int id) {}
}

//假的
class accountRepo extends repository<fakeAccount> {
  final accountsKey = "accounts";

  Future<List<fakeAccount>> getDatas() async {
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(accountsKey) ?? '';
    if (data == '') return [];
    List<dynamic> accountsDict = jsonDecode(data);

    return accountsDict.map((e) => fakeAccount.fromJson(e)).toList();
  }

  @override
  Future<fakeAccount?> login(String account, String password) async {
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(accountsKey) ?? '';
    if (data == '') return null;
    // List<Map<String, dynamic>> accountsDict = jsonDecode(data);
    List<dynamic> accountsDict = jsonDecode(data);
    List<fakeAccount> accounts = accountsDict.map((e) => fakeAccount.fromJson(e)).toList();
    int index = accounts.indexWhere((element) => element.account == account && element.password == password);
    if (index != -1) return accounts[index];
    return null;
  }

  @override
  Future<bool> register(Map<String, dynamic> json) async {
    List<fakeAccount> accounts = await getDatas();
    accounts.add(fakeAccount.fromJson(json));
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.setString(accountsKey, jsonEncode(accounts));
    return res;
  }

  @override
  Future<bool> edit(int id, fakeAccount data) async {
    List<fakeAccount> accounts = await getDatas();
    accounts.forEach((element) {
      if (element.id == id) {
        element = data;
      }
    });
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.setString(accountsKey, jsonEncode(accounts));
    return res;
  }

  @override
  Future<bool> delete(int id) async {
    List<fakeAccount> accounts = await getDatas();
    accounts.removeWhere((element) => element.id == id);
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.setString(accountsKey, jsonEncode(accounts));
    return res;
  }
}

//真的
class accountRepo2 extends repository {
  @override
  login(String account, String password) {
    // TODO: implement login
    return super.login(account, password);
  }
}
