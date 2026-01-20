/// status : "200"
/// total_count : 2
/// data : [{"id":"43","fname":"Chain Singh","email":"tdchainsingh@gmail.com","mobile":"0789654321","type":"user","password":"Chain@123","status":"1","created":"2024-01-25 10:46:38"},{"id":"39","fname":"Adarsh  Chauhan","email":"technoderivationadarsh@gmail.com","mobile":"1234567890","type":"user","password":"Adarsh@123","status":"1","created":"2024-01-24 19:13:45"}]

class AllUserResponse {
  AllUserResponse({
      String? status, 
      num? totalCount, 
      List<Data>? data,}){
    _status = status;
    _totalCount = totalCount;
    _data = data;
}

  AllUserResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalCount = json['total_count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalCount;
  List<Data>? _data;
AllUserResponse copyWith({  String? status,
  num? totalCount,
  List<Data>? data,
}) => AllUserResponse(  status: status ?? _status,
  totalCount: totalCount ?? _totalCount,
  data: data ?? _data,
);
  String? get status => _status;
  num? get totalCount => _totalCount;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total_count'] = _totalCount;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "43"
/// fname : "Chain Singh"
/// email : "tdchainsingh@gmail.com"
/// mobile : "0789654321"
/// type : "user"
/// password : "Chain@123"
/// status : "1"
/// created : "2024-01-25 10:46:38"

class Data {
  Data({
      String? id, 
      String? fname, 
      String? email, 
      String? mobile, 
      String? type, 
      String? password, 
      String? status, 
      String? created,}){
    _id = id;
    _fname = fname;
    _email = email;
    _mobile = mobile;
    _type = type;
    _password = password;
    _status = status;
    _created = created;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _fname = json['fname'];
    _email = json['email'];
    _mobile = json['mobile'];
    _type = json['type'];
    _password = json['password'];
    _status = json['status'];
    _created = json['created'];
  }
  String? _id;
  String? _fname;
  String? _email;
  String? _mobile;
  String? _type;
  String? _password;
  String? _status;
  String? _created;
Data copyWith({  String? id,
  String? fname,
  String? email,
  String? mobile,
  String? type,
  String? password,
  String? status,
  String? created,
}) => Data(  id: id ?? _id,
  fname: fname ?? _fname,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  type: type ?? _type,
  password: password ?? _password,
  status: status ?? _status,
  created: created ?? _created,
);
  String? get id => _id;
  String? get fname => _fname;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get type => _type;
  String? get password => _password;
  String? get status => _status;
  String? get created => _created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fname'] = _fname;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['type'] = _type;
    map['password'] = _password;
    map['status'] = _status;
    map['created'] = _created;
    return map;
  }

}