import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorial/customWidget.dart/customAppBar.dart';
import 'package:riverpod_tutorial/customWidget.dart/customWidget.dart';
import 'package:riverpod_tutorial/account/domain/model.dart';

class infoPage extends HookConsumerWidget {
  final fakeAccount data;
  const infoPage({required this.data, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: customAppBar(title: 'Info'),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customTitleCard('id'),
                  customTitleCardTxt(data.id.toString()),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  customTitleCard('名稱'),
                  customTitleCardTxt(data.name),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  customTitleCard('電話'),
                  customTitleCardTxt(data.phone),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  customTitleCard('信箱'),
                  customTitleCardTxt(data.mail),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
