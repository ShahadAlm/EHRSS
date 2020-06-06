
class Note{
  String _notename;
  String _notedetails;
  String _notedate;
  String _documentId;

  Note(this._notename,this._notedetails,this._notedate,this._documentId);

  Note.map(dynamic obj){
    this._notename = obj['notename'];
    this._notedetails = obj['notedetails'];
    this._notedate = obj['notedate'].toDate();
    this._documentId = obj.documentId;
  }

  String get  notename => _notename;
  String get notedetails => _notedetails;
  String get notedate => _notedate;
  String get documentId => _documentId;

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['notename']=_notename;
     map['notedetails'] = _notedetails;
    map['notedate'] = _notedate;
    map['documentId'] = _documentId;
    return map;
  }

  Note.fromMap(Map<String,dynamic> map){
    this._notename= map['notename'];
    this._notedetails = map['notedetails'];
    this._notedate = map['notedate'].toDate();
    this._documentId = map['documentId'];
  }
}