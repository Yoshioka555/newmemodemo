import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../domain/memo.dart';

class MainPageModel extends ChangeNotifier {

  List<Directory>? directory;

  void fetchDirectoryList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('memolist').get();
    final List<Directory> directory = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String id = document.id;
      final String year = data['year'];
      return Directory(id, year);
    }).toList();

    this.directory = directory;
    notifyListeners();
  }

  Future delete(Directory directory) {
    return FirebaseFirestore.instance.collection('memolist').doc(directory.id).delete();
  }
}