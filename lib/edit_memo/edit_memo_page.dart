import 'package:flutter/material.dart';
import 'package:newmemodemo/edit_memo/edit_memo_model.dart';
import 'package:provider/provider.dart';
import '../domain/memo.dart';

class EditMemoPage extends StatefulWidget {
  final Memo memo;
  EditMemoPage(this.memo, {super.key});
  @override
  _EditMemoPageState createState() => _EditMemoPageState();
}

class _EditMemoPageState extends State<EditMemoPage> {

  String? _team ;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditMemoModel>(
      create: (_) => EditMemoModel(widget.memo),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('リストを編集'),
        ),
        body: Center(
            child: Consumer<EditMemoModel>(builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: model.titleController,
                      decoration: const InputDecoration(
                          hintText: 'タイトルを入力'
                      ),
                      onChanged: (text) {
                        model.setTitle(text);
                      },
                    ),
                    TextField(
                      controller: model.nameController,
                      decoration: const InputDecoration(
                          hintText: '製作者名を入力'
                      ),
                      onChanged: (text) {
                        model.setName(text);
                      },
                    ),
                    RadioListTile(
                      title: const Text('Web'),
                      value: 'Web',
                      groupValue: _team,
                      onChanged: (value) {
                        setState(() {
                          _team = value!;
                          model.team = _team;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Net'),
                      value: 'Net',
                      groupValue: _team,
                      onChanged: (value) {
                        setState(() {
                          _team = value!;
                          model.team = _team;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Grid'),
                      value: 'Grid',
                      groupValue: _team,
                      onChanged: (value) {
                        setState(() {
                          _team = value!;
                          model.team = _team;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Net+Grid'),
                      value: 'Net+Grid',
                      groupValue: _team,
                      onChanged: (value) {
                        setState(() {
                          _team = value!;
                          model.team = _team;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('All'),
                      value: 'All',
                      groupValue: _team,
                      onChanged: (value) {
                        setState(() {
                          _team = value!;
                          model.team = _team;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: model.isUpdated() ? () async {
                        //model.team = _team;
                        try {
                          await model.update();
                          Navigator.of(context).pop(model.title);
                        } catch(e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).
                              showSnackBar(snackBar);
                        }
                      } : null,
                      child: const Text('更新する')
                    ),
                  ],
                ),
              );
            })
        ),
      ),
    );
  }
}