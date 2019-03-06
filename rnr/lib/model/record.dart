import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class Record extends Object {
  bool read = false;
  bool runned = false;
  bool zous = false;

  Record({this.read = false, this.runned = false, this.zous = false});
  factory Record.fromJson(Map<String, dynamic> json) {
    return new Record(
      read: json['read'],
      runned: json['runned'],
      zous: json['zous'],
    );
  }

  Map<String, dynamic> toJson() => {
        'read': read,
        'runned': runned,
        'zous':zous,
      };
}

class Records extends Object {
  static Records _instance;
  static Records _getInstance() {
    if (_instance == null) {
      _instance = new Records();
    }
    return _instance;
  }

  static Records get shared => _getInstance();

  Map<String, Record> _records;

  Future loadFromCache() async {
    _records = Map();
    try {
      var filepath = await _filePath();
      var file = File(filepath);
      String content = await file.readAsString();
      Map<String, dynamic> json = jsonDecode(content);
      json.forEach((k, v) {
        Record record = Record.fromJson(v);
        _records[k] = record;
      });
    } catch (e) {
      print('get exception');
    }
  }

  void setZous(bool flag, DateTime date) {
    var record = _createRecord(date);
    record.zous = flag;
    _setRecod(record, date);
  }

  bool zous(DateTime date) {
    var key = _keyBy(date);
    var record = _records[key];
    return record != null ? record.zous : false;
  }

  void setRunned(bool flag, DateTime date) {
    var record = _createRecord(date);
    record.runned = flag;
    _setRecod(record, date);
  }

  bool runned(DateTime date) {
    var key = _keyBy(date);
    var record = _records[key];
    return record != null ? record.runned : false;
  }

  void setRead(bool flag, DateTime date) {
    var record = _createRecord(date);
    record.read = flag;
    _setRecod(record, date);
  }

  bool read(DateTime date) {
    var key = _keyBy(date);
    var record = _records[key];
    return record != null ? record.read : false;
  }

  Record _createRecord(DateTime date) {
    var key = _keyBy(date);
    var record = _records[key];
    if (record == null) {
      record = Record();
    }
    return record;
  }

  void _setRecod(Record record, DateTime date) {
    var key = _keyBy(date);
    _records[key] = record;
    _saveFile();
  }

  String _keyBy(DateTime date) {
    return date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString();
  }

  Future _saveFile() async {
    try {
      var filepath = await _filePath();
      var jsonString = json.encode(_records);
      var file = File(filepath);
      file.writeAsString(jsonString);
    } catch (e) {}
  }

  Future<String> _filePath() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    return appDir.path + '/records.json';
  }
}
