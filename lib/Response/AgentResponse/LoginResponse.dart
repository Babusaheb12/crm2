/// status : "200"
/// message : "Sucessfully login."
/// data : {"token":"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*","sign":"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*","userid":"24","email":"m.bhau90@gmail.com","type":"manager"}

class LoginResponse {
  LoginResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
LoginResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => LoginResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// token : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*"
/// sign : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz98440127924587413698552@#$%&*"
/// userid : "24"
/// email : "m.bhau90@gmail.com"
/// type : "manager"

class Data {
  Data({
      String? token, 
      String? sign, 
      String? userid, 
      String? email, 
      String? type,}){
    _token = token;
    _sign = sign;
    _userid = userid;
    _email = email;
    _type = type;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _sign = json['sign'];
    _userid = json['userid'];
    _email = json['email'];
    _type = json['type'];
  }
  String? _token;
  String? _sign;
  String? _userid;
  String? _email;
  String? _type;
Data copyWith({  String? token,
  String? sign,
  String? userid,
  String? email,
  String? type,
}) => Data(  token: token ?? _token,
  sign: sign ?? _sign,
  userid: userid ?? _userid,
  email: email ?? _email,
  type: type ?? _type,
);
  String? get token => _token;
  String? get sign => _sign;
  String? get userid => _userid;
  String? get email => _email;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['sign'] = _sign;
    map['userid'] = _userid;
    map['email'] = _email;
    map['type'] = _type;
    return map;
  }

}