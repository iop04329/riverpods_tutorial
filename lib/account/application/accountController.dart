import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/account/data/repository.dart';
import 'package:riverpod_tutorial/account/domain/model.dart';

final accountCtrProvider = Provider.autoDispose<accountController>((ref) {
  final _accountRepo = ref.watch(accountRepoProvider);
  return accountController(_accountRepo, ref);
});

class accountController {
  final accountRepo _accountRepo;
  final Ref _ref;
  accountController(this._accountRepo, this._ref);

  Future<List<fakeAccount>> getDatas() async {
    final accounts = await _accountRepo.getDatas();
    return accounts;
  }

  Future<int> getId() async {
    final accounts = await _accountRepo.getDatas();
    if (accounts.isEmpty)
      return 1;
    else {
      final accounts2 = accounts.map((e) => e.id).toSet().toList();
      accounts2.sort();
      return accounts2.last + 1;
    }
  }

  Future<fakeAccount?> login(String account, String password) async {
    return await _accountRepo.login(account, password);
  }

  Future<bool> register(Map<String, dynamic> json) async {
    return await _accountRepo.register(json);
  }

  Future<bool> edit(int id, fakeAccount data) async {
    return await _accountRepo.edit(id, data);
  }

  Future<bool> delete(int id) async {
    return await _accountRepo.delete(id);
  }
}
