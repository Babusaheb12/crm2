/// status : "200"
/// total_count : 1
/// data : [{"id":"79","fname":"hrnew","manager_name":"Bhawna sharma","manager_id":"78","email":"hr1@gmail.com","mobile":"8745874587","type":"user","password":"123456","status":"1","created":"2026-01-26 02:37 pm"}]

class AllHrUserResponse {
  AllHrUserResponse({
    String? status, 
    num? totalCount, 
    List<HrUserData>? data,
  }) {
    _status = status;
    _totalCount = totalCount;
    _data = data;
  }

  AllHrUserResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalCount = json['total_count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(HrUserData.fromJson(v));
      });
    }
  }
  
  String? _status;
  num? _totalCount;
  List<HrUserData>? _data;
  
  AllHrUserResponse copyWith({
    String? status,
    num? totalCount,
    List<HrUserData>? data,
  }) => AllHrUserResponse(
    status: status ?? _status,
    totalCount: totalCount ?? _totalCount,
    data: data ?? _data,
  );
  
  String? get status => _status;
  num? get totalCount => _totalCount;
  List<HrUserData>? get data => _data;

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

/// id : "79"
/// fname : "hrnew"
/// manager_name : "Bhawna sharma"
/// manager_id : "78"
/// email : "hr1@gmail.com"
/// mobile : "8745874587"
/// type : "user"
/// password : "123456"
/// status : "1"
/// created : "2026-01-26 02:37 pm"

class HrUserData {
  HrUserData({
    String? id, 
    String? fname, 
    String? managerName, 
    String? managerId, 
    String? email, 
    String? mobile, 
    String? type, 
    String? password, 
    String? status, 
    String? created,
  }) {
    _id = id;
    _fname = fname;
    _managerName = managerName;
    _managerId = managerId;
    _email = email;
    _mobile = mobile;
    _type = type;
    _password = password;
    _status = status;
    _created = created;
  }

  HrUserData.fromJson(dynamic json) {
    _id = json['id'];
    _fname = json['fname'];
    _managerName = json['manager_name'];
    _managerId = json['manager_id'];
    _email = json['email'];
    _mobile = json['mobile'];
    _type = json['type'];
    _password = json['password'];
    _status = json['status'];
    _created = json['created'];
  }
  
  String? _id;
  String? _fname;
  String? _managerName;
  String? _managerId;
  String? _email;
  String? _mobile;
  String? _type;
  String? _password;
  String? _status;
  String? _created;
  
  HrUserData copyWith({
    String? id,
    String? fname,
    String? managerName,
    String? managerId,
    String? email,
    String? mobile,
    String? type,
    String? password,
    String? status,
    String? created,
  }) => HrUserData(
    id: id ?? _id,
    fname: fname ?? _fname,
    managerName: managerName ?? _managerName,
    managerId: managerId ?? _managerId,
    email: email ?? _email,
    mobile: mobile ?? _mobile,
    type: type ?? _type,
    password: password ?? _password,
    status: status ?? _status,
    created: created ?? _created,
  );
  
  String? get id => _id;
  String? get fname => _fname;
  String? get managerName => _managerName;
  String? get managerId => _managerId;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get type => _type;
  String? get password => _password;
  String? get status => _status;
  set status(String? value) => _status = value;
  String? get created => _created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fname'] = _fname;
    map['manager_name'] = _managerName;
    map['manager_id'] = _managerId;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['type'] = _type;
    map['password'] = _password;
    map['status'] = _status;
    map['created'] = _created;
    return map;
  }
}