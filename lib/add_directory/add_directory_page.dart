import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../now_time/now_time_function.dart';
import 'add_directory_model.dart';

class AddDirectoryPage extends StatefulWidget {
  @override
  _AddDirectoryPageState createState() => _AddDirectoryPageState();
}

class _AddDirectoryPageState extends State<AddDirectoryPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddDirectoryModel>(
      create: (_) => AddDirectoryModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ディレクトリを追加'),
        ),
        body: Center(
            child: Consumer<AddDirectoryModel>(builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'ディレクトリのタイトル',
                      ),
                      onChanged: (text) {
                        model.year = text;
                      },
                    ),

                    ElevatedButton(
                        onPressed: () async {
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
