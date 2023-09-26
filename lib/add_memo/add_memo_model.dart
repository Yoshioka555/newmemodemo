import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class AddMemoModel extends ChangeNotifier {
  String? title;
  String? name;
  String? mainText;
  String? team;
  String? date;

  Future addMemo() async {
    if (title == null || title!.isEmpty) {
      throw 'タイトルが入力されていません';
    }

    if (name == null || name!.isEmpty) {
      throw '製作者名が入力されていません';
    }

    //firestoreに追加
    await FirebaseFirestore.instance.collection('memolist').add({
      'title': title,
      'date': date,
      'name': name,
      'team': team,
      'mainText': mainText,
    });
  }
}