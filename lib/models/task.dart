
class Task{
  String _taskname;
  String _taskdetails;
  String _taskdate;
  String _taskState;
  String _tasktype;

  Task(this._taskname,this._taskdetails,this._taskdate,this._taskState,this._tasktype);

  Task.map(dynamic obj){
    this._taskname = obj['taskname'];
    this._taskdetails = obj['taskdetails'];
    this._taskdate = obj['taskdate'];
    this._taskState = obj['taskState'];
    this._tasktype = obj['tasktype'];
  }

  String get  taskname=> _taskname;
  String get taskdetails => _taskdetails;
  String get taskdate => _taskdate;
  String get tasktState => _taskState;
  String get tasktype => _tasktype;

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['taskname']=_taskname;
     map['taskdetails'] = _taskdetails;
    map['taskdate'] = _taskdate;
    map['taskState'] = _taskState;
    map['tasktype'] = _tasktype;
    return map;
  }

  Task.fromMap(Map<String,dynamic> map){
    this._taskname= map['taskname'];
    this._taskdetails = map['taskdetails'];
    this._taskdate = map['taskdate'];
    this._taskState = map['taskState'];
    this._tasktype = map['tasktype'];
  }
}