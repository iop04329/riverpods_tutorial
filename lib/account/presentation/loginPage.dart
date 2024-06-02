import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_tutorial/customWidget.dart/customAppBar.dart';
import 'package:riverpod_tutorial/customWidget.dart/customWidget.dart';
import 'package:riverpod_tutorial/account/application/accountController.dart';
import 'package:riverpod_tutorial/account/domain/model.dart';
import 'package:riverpod_tutorial/account/presentation/dataBasePage.dart';
import 'package:riverpod_tutorial/account/presentation/infoPage.dart';
import 'package:riverpod_tutorial/account/presentation/register.dart';
import 'package:riverpod_tutorial/pub/pub.dart';

//consumer 可使用ref
//hook鉤子  可使用useState useEffect
//stateful 可使用 initState setState
class loginPage extends StatefulHookConsumerWidget {
  const loginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _loginPageState();
}

class _loginPageState extends ConsumerState<loginPage> {
  // @override
  // // TODO: implement ref
  // WidgetRef get ref => super.ref;

  TextEditingController accountCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showAccount = useState('');
    final showPassword = useState('');

    //跟放在initState 初始化監聽差不多
    useEffect(() {
      accountCtr.addListener(() {
        showAccount.value = accountCtr.text;
        print(accountCtr.text);
      });

      return null;
    }, [accountCtr]);
    useEffect(() {
      passwordCtr.addListener(() {
        showPassword.value = passwordCtr.text;
        print(passwordCtr.text);
      });
      return null;
    }, [passwordCtr]);
    return Scaffold(
        appBar: customAppBar(title: 'Login'),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleTxt('帳號'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: accountCtr,
              ),
              SizedBox(height: 10),
              Text(showAccount.value),
              SizedBox(height: 10),
              titleTxt('密碼'),
              SizedBox(height: 10),
              customEditField(
                height: 35,
                width: Pub.screenWidth * 0.6,
                ctr: passwordCtr,
              ),
              SizedBox(height: 10),
              Text(showPassword.value),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    final accountProvider = ref.read(accountCtrProvider);
                    final account = await accountProvider.login(accountCtr.text, passwordCtr.text);
                    if (account != null)
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ct) => infoPage(data: account),
                        ),
                      );
                    else
                      print('登入失敗');
                  },
                  child: Text('登入')),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ct) => registerPage(),
                        ),
                      ),
                  child: Text('註冊')),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ct) => dataBasePage(),
                        ),
                      ),
                  child: Text('查看')),
            ],
          ),
        ));
  }
}
