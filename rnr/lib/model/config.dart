import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class Configs extends Object {
  static Configs _instance;
  static Configs _getInstance() {
    if (_instance == null) {
      _instance = new Configs();
    }
    return _instance;
  }

  static Configs get shared => _getInstance();

  Map<String, dynamic> _configs;

  void setBoy(bool boy) {
    if(_configs != null) {
      _configs['boy'] = boy;
      _saveFile();
    }

  }

  bool boy(){
    if (_configs != null && _configs.containsKey('boy')) {
      return _configs['boy'];
    }
    return false;
  }

  Future loadFromCache() async {
    _configs =Map();
    try {

      var filepath = await _filePath();
      var file =File(filepath);
      String content = await file.readAsString();
      Map<String,dynamic> json = jsonDecode(content);
      _configs = json;
      } catch (e) {
        print('get exception');
    }
  }

  Future _saveFile() async {
    try {
      var filepath = await _filePath();
      var jsonString = json.encode(_configs);
      var file = File(filepath);
      file.writeAsString(jsonString);
    } catch (e) {}
  }

  Future<String> _filePath() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    return appDir.path + '/setting.json';
  }
}


String readEmoji() => '📖';
String runEmoji() {
  return Configs.shared.boy() ? '🏃' : '🏃‍♀️';
}