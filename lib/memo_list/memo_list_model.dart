import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../domain/memo.dart';

class MemoListModel extends ChangeNotifier {

  List<Memo>? memo;

  void fetchMemoList() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('memolist').get();
    final List<Memo> memo = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String id = document.id;
      final String title = data['title'];
      final String date = data['date'];
      final String name = data['name'];
      final String team = data['team'];
      final String mainText = data['mainText'];
      return Memo(id, title, date, name, team, mainText);
    }).toList();

    this.memo = memo;
    notifyListeners();
  }

  Future delete(Memo memo) {
    return FirebaseFirestore.instance.collection('memolist').doc(memo.id).delete();
  }
}