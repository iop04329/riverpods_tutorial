import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorial/account/data/repository.dart';
import 'package:riverpod_tutorial/customWidget.dart/customAppBar.dart';
import 'package:riverpod_tutorial/customWidget.dart/customWidget.dart';
import 'package:riverpod_tutorial/account/application/accountController.dart';
import 'package:riverpod_tutorial/account/domain/model.dart';
import 'package:riverpod_tutorial/pub/pub.dart';

//
class dataBasePage extends ConsumerStatefulWidget {
  const dataBasePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _dataBasePageState();
}

class _dataBasePageState extends ConsumerState<dataBasePage> {
  // ValueNotifier + ValueListenableBuilder
  ValueNotifier<bool> isInitializing = ValueNotifier(true);
  ValueNotifier<List<fakeAccount>> items = ValueNotifier([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final accountProvider = ref.read(accountCtrProvider);
    items.value = await accountProvider.getDatas();
    await Future.delayed(Duration(seconds: 1));
    isInitializing.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: '資料庫'),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: isInitializing,
            builder: (context, value, child) {
              return isInitializing.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: items.value.length,
                      itemBuilder: (_, ind) {
                        return Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                            // height: ,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    customTitleCard('id'),
                                    customTitleCardTxt(items.value[ind].id.toString()),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    customTitleCard('名稱'),
                                    customTitleCardTxt(items.value[ind].name),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    customTitleCard('帳號'),
                                    customTitleCardTxt(items.value[ind].account),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    customTitleCard('密碼'),
                                    customTitleCardTxt(items.value[ind].password),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    customTitleCard('電話'),
                                    customTitleCardTxt(items.value[ind].phone),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    customTitleCard('信箱'),
                                    customTitleCardTxt(items.value[ind].mail),
                                  ],
                                ),
                              ],
                            ));
                      });
            },
          ),
        ));
  }
}
