import 'package:flutter/material.dart';

class customEditField extends StatelessWidget {
  final double? width;
  final double height;
  final TextEditingController? ctr;
  final bool enable;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  const customEditField({
    this.width,
    this.height = 35,
    this.ctr,
    this.enable = true,
    this.onTap,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(children: [
        Expanded(
          child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26),
                color: Color(0xFFF1F1F1),
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: keyboardType,
                          controller: ctr,
                          decoration: const InputDecoration.collapsed(hintText: '請輸入', hintStyle: TextStyle(color: Colors.grey)),
                          style: const TextStyle(height: 1.2, fontSize: 14),
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          enabled: enable,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: onTap,
                            child: Icon(Icons.close, color: Colors.grey, size: 14),
                          )),
                    ],
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

class titleTxt extends StatelessWidget {
  final String text;
  const titleTxt(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}

class customTitleCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  const customTitleCard(this.title, {this.width = 70, this.height = 20, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary, borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}

class customTitleCardTxt extends StatelessWidget {
  final String txt;
  const customTitleCardTxt(this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
      ),
    );
  }
}
