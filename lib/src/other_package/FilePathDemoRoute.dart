import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FilePathProviderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FileOperationRouteState();
  }
}

class _FileOperationRouteState extends State<FilePathProviderRoute> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("path_provider: ^1.1.2"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "文件操作(File路径)",
              style: TextStyle(fontSize: 20),
            ),
            Text("版本依赖：path_provider: ^1.1.2\n"
                "pub地址：https://pub.dev/packages/path_provider\n"
                "Dart的IO库包含了文件读写的相关类,无论是Dart VM下的脚本还是Flutter，都是通过Dart IO库来操作文件的;\n"
                "PathProvider 插件是为了提供统一的Android和iOS的应用存储目录；\n\n"
                "    临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除的临时目录（缓存）。"
                "在iOS上，这对应于NSTemporaryDirectory() 返回的值。在Android上，这是getCacheDir())返回的值。\n\n"
                "    文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。"
                "只有当应用程序被卸载时，系统才会清除该目录。在iOS上，这对应于NSDocumentDirectory。在Android上，这是AppData目录。\n\n"
                "    外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录;ios没有外部存储，将会抛出异常，不建议使用；\n\n"),
            RaisedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text("向文件写入点击次数。然后build时再取出"),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(10), child: Text('点击了 $_counter 次')),
            )
          ],
        ),
      ),
    );
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }
}
