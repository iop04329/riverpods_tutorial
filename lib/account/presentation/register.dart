import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_tutorial/customWidget.dart/customAppBar.dart';
import 'package:riverpod_tutorial/customWidget.dart/customWidget.dart';
import 'package:riverpod_tutorial/account/application/accountController.dart';
import 'package:riverpod_tutorial/account/domain/model.dart';
import 'package:riverpod_tutorial/pub/pub.dart';

class registerPage extends StatefulHookConsumerWidget {
  const registerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _registerPageState();
}

class _registerPageState extends ConsumerState<registerPage> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController accountCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController mailCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  checkCanRegister(ValueNotifier canRegister) {
    if (nameCtr.text != '' && accountCtr.text != '' && passwordCtr.text != '' && mailCtr.text != '' && phoneCtr.text != '')
      canRegister.value = true;
    else
      canRegister.value = false;
  }

  register(WidgetRef ref) async {
    final accountProvider = ref.read(accountCtrProvider);
    int id = await accountProvider.getId();
    fakeAccount registerData = fakeAccount(
      id,
      nameCtr.text,
      phoneCtr.text,
      mailCtr.text,
      accountCtr.text,
      passwordCtr.text,
    );
    bool isOk = await accountProvider.register(registerData.toJson());
    if (isOk)
      Navigator.of(context).pop();
    else
      print('註冊失敗');
  }

  @override
  Widget build(BuildContext context) {
    final canRegister = useState(false);
    nameCtr.addListener(() {
      checkCanRegister(canRegister);
      print(nameCtr.text);
    });
    accountCtr.addListener(() {
      checkCanRegister(canRegister);
      print(accountCtr.text);
    });
    passwordCtr.addListener(() {
      checkCanRegister(canRegister);
      print(passwordCtr.text);
    });
    mailCtr.addListener(() {
      checkCanRegister(canRegister);
      print(mailCtr.text);
    });
    phoneCtr.addListener(() {
      checkCanRegister(canRegister);
      print(phoneCtr.text);
    });
    // checkCanRegister() {
    //   if (nameCtr.text != '' && accountCtr.text != '' && passwordCtr.text != '' && mailCtr.text != '' && phoneCtr.text != '')
    //     canRegister.value = true;
    //   else
    //     canRegister.value = false;
    // }

    return Scaffold(
        appBar: customAppBar(title: 'Register'),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              titleTxt('名字'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: nameCtr,
              ),
              SizedBox(height: 10),
              titleTxt('帳號'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: accountCtr,
              ),
              SizedBox(height: 10),
              titleTxt('密碼'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: passwordCtr,
              ),
              SizedBox(height: 10),
              titleTxt('信箱'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: mailCtr,
              ),
              SizedBox(height: 10),
              titleTxt('電話'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: phoneCtr,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: !canRegister.value ? () {} : () => register(ref),
                child: Text(
                  '完成',
                  style: TextStyle(color: canRegister.value ? Theme.of(context).colorScheme.primary : Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}
