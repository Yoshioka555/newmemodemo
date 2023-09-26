import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../now_time/now_time_function.dart';
import 'add_memo_model.dart';

class AddMemoPage extends StatefulWidget {
  @override
  _AddMemoPageState createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {

  String _team = 'Web班';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddMemoModel>(
      create: (_) => AddMemoModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('議事録を追加'),
        ),
        body: Center(
          child: Consumer<AddMemoModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'タイトル',
                    ),
                    onChanged: (text) {
                      model.title = text;
                    },
                  ),
                  TextField(
                    onChanged: (text) {
                      model.name = text;
                    },
                    decoration: const InputDecoration(
                      labelText: '製作者名',
                    ),
                  ),
                  RadioListTile(
                    title: const Text('Web班'),
                    value: 'Web班',
                    groupValue: _team,
                    onChanged: (value) {
                      setState(() {
                        _team = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Net班'),
                    value: 'Net班',
                    groupValue: _team,
                    onChanged: (value) {
                      setState(() {
                        _team = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Grid班'),
                    value: 'Grid班',
                    groupValue: _team,
                    onChanged: (value) {
                      setState(() {
                        _team = value!;
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
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      model.team = _team;
                      model.mainText = '';
                      model.date = nowTime();
                      try{
                        await model.addMemo();
                        Navigator.of(context).pop(true);
                      } catch(e) {
                        final snacBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snacBar);
                      }
                    },
                    child: const Text('追加する')
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