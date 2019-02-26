class Record extends Object
{
  bool read =false;
  bool runned =false;
}

class Records extends Object
{
  Map<String,Record> _records =Map();

  void setRunned(bool flag,DateTime date) {
    var record =_createRecord(date);
    record.runned =flag;
    _setRecod(record, date);
  }

  bool runned(DateTime date) {
    var key =_keyBy(date);
    var record =_records[key];
    return record !=null ? record.runned :false;
  }

  void setRead(bool flag,DateTime date) {
    var record =_createRecord(date);
    record.read =flag;
    _setRecod(record, date);
  }

  bool read(DateTime date) {
    var key =_keyBy(date);
    var record =_records[key];
    return record !=null ? record.read :false;
  }

  Record _createRecord(DateTime date) {
    var key =_keyBy(date);
    var record = _records[key];
    if(record ==null) {
      record =Record();
    }
    return record;
  }

  void _setRecod(Record record,DateTime date){
    var key =_keyBy(date);
    _records[key] = record;
  }

  String _keyBy(DateTime date) {
    return date.year.toString() + '-' + date.month.toString() + date.day.toString();
  } 



}