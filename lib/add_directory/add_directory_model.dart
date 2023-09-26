import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddDirectoryModel extends ChangeNotifier {
  String? year;

  Future addMemo() async {
    if (year == null || year!.isEmpty) {
      throw 'タイトルが入力されていません';
    }

    //firestoreに追加
    await FirebaseFirestore.instance.collection('memolist').add({
      'year': year,
    });
  }
}