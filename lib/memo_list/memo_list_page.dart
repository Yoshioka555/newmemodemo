import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:newmemodemo/add_memo/add_memo_page.dart';
import 'package:newmemodemo/main_text/main_text_page.dart';
import 'package:newmemodemo/memo_list/memo_list_model.dart';
import 'package:provider/provider.dart';
import '../domain/memo.dart';
import '../edit_memo/edit_memo_page.dart';

class MemoListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemoListModel>(
      create: (_) => MemoListModel()..fetchMemoList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('議事録一覧'),
        ),
        body: Center(
          child: Consumer<MemoListModel>(builder: (context, model, child) {
            final List<Memo>? memo = model.memo;

            if (memo == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = memo.map(
              (memo) => Slidable(
                actionPane: const SlidableDrawerActionPane(),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: '編集',
                    color: Colors.grey[350],
                    icon: Icons.edit,
                    onTap: () async {
                      final String? title = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditMemoPage(memo),
                        ),
                      );
                      if (title != null) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('『$title』を編集しました'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      model.fetchMemoList();
                    },
                  ),
                  IconSlideAction(
                    caption: '削除',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () async {
                      // 削除しますか？って聞いて、はいだったら削除
                      await showConfirmDialog(context, memo, model);
                    },
                  ),
                ],
                child: ListTile(
                  title: Text('${memo.title}　${memo.team}'),
                  subtitle: Text('${memo.date}    製作者名 ${memo.name}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.login_outlined),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainTextPage(memo)),
                      );
                      model.fetchMemoList();
                    },
                  ),
                ),
              ),
            ).toList();
            return ListView(
              children: widgets,
            );
          })
        ),
        floatingActionButton: Consumer<MemoListModel>(builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () async {
                final bool? added = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMemoPage(),
                    fullscreenDialog: true,
                  ),
                );

                if (added != null && added) {
                  const snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('議事録を追加しました'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                model.fetchMemoList();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }

  Future showConfirmDialog(BuildContext context, Memo memo, MemoListModel model) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("削除の確認"),
          content: Text("『${memo.title}』を削除しますか？"),
          actions: [
            TextButton(
              child: const Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("はい"),
              onPressed: () async {
                // modelで削除
                await model.delete(memo);
                Navigator.pop(context);
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('『${memo.title}』を削除しました'),
                );
                model.fetchMemoList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
