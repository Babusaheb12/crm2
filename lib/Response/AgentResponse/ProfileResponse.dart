/// status : "200"
/// data : {"id":"41","fname":"Mohit Patil","email":"maratha.technoderivation@gmail.com","mobile":"9087654321","type":"user"}

class ProfileResponse {
  ProfileResponse({
      String? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  ProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Data? _data;
ProfileResponse copyWith({  String? status,
  Data? data,
}) => ProfileResponse(  status: status ?? _status,
  data: data ?? _data,
);
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "41"
/// fname : "Mohit Patil"
/// email : "maratha.technoderivation@gmail.com"
/// mobile : "9087654321"
/// type : "user"

class Data {
  Data({
      String? id, 
      String? fname, 
      String? email, 
      String? mobile, 
      String? type,}){
    _id = id;
    _fname = fname;
    _email = email;
    _mobile = mobile;
    _type = type;
}

  Data.fromJson(dynamic json) {
    _id = json['id']??"";
    _fname = json['fname']??"";
    _email = json['email']??"";
    _mobile = json['mobile']??"";
    _type = json['type']??"";
  }
  String? _id;
  String? _fname;
  String? _email;
  String? _mobile;
  String? _type;
Data copyWith({  String? id,
  String? fname,
  String? email,
  String? mobile,
  String? type,
}) => Data(  id: id ?? _id,
  fname: fname ?? _fname,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  type: type ?? _type,
);
  String? get id => _id;
  String? get fname => _fname;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fname'] = _fname;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['type'] = _type;
    return map;
  }

}