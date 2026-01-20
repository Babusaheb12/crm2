/// status : "200"
/// data : [{"id":"2","client_name":"Super Construction","client_mobile":"+918854842806","client_email":null,"call_duration_in_second":"0","calling_type":"Outgoing","calling_time":"10:32","calling_date":"2025-04-15","calling_platform":"call"}]

class ActivityDetailsResponse {
  ActivityDetailsResponse({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  ActivityDetailsResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  List<Data>? _data;
ActivityDetailsResponse copyWith({  String? status,
  List<Data>? data,
}) => ActivityDetailsResponse(  status: status ?? _status,
  data: data ?? _data,
);
  String? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// client_name : "Super Construction"
/// client_mobile : "+918854842806"
/// client_email : null
/// call_duration_in_second : "0"
/// calling_type : "Outgoing"
/// calling_time : "10:32"
/// calling_date : "2025-04-15"
/// calling_platform : "call"

class Data {
  Data({
      String? id, 
      String? clientName, 
      String? clientMobile, 
      dynamic clientEmail, 
      String? callDurationInSecond, 
      String? callingType, 
      String? callingTime, 
      String? callingDate, 
      String? callingPlatform,}){
    _id = id;
    _clientName = clientName;
    _clientMobile = clientMobile;
    _clientEmail = clientEmail;
    _callDurationInSecond = callDurationInSecond;
    _callingType = callingType;
    _callingTime = callingTime;
    _callingDate = callingDate;
    _callingPlatform = callingPlatform;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _clientName = json['client_name'];
    _clientMobile = json['client_mobile'];
    _clientEmail = json['client_email'];
    _callDurationInSecond = json['call_duration_in_second'];
    _callingType = json['calling_type'];
    _callingTime = json['calling_time'];
    _callingDate = json['calling_date'];
    _callingPlatform = json['calling_platform'];
  }
  String? _id;
  String? _clientName;
  String? _clientMobile;
  dynamic _clientEmail;
  String? _callDurationInSecond;
  String? _callingType;
  String? _callingTime;
  String? _callingDate;
  String? _callingPlatform;
Data copyWith({  String? id,
  String? clientName,
  String? clientMobile,
  dynamic clientEmail,
  String? callDurationInSecond,
  String? callingType,
  String? callingTime,
  String? callingDate,
  String? callingPlatform,
}) => Data(  id: id ?? _id,
  clientName: clientName ?? _clientName,
  clientMobile: clientMobile ?? _clientMobile,
  clientEmail: clientEmail ?? _clientEmail,
  callDurationInSecond: callDurationInSecond ?? _callDurationInSecond,
  callingType: callingType ?? _callingType,
  callingTime: callingTime ?? _callingTime,
  callingDate: callingDate ?? _callingDate,
  callingPlatform: callingPlatform ?? _callingPlatform,
);
  String? get id => _id;
  String? get clientName => _clientName;
  String? get clientMobile => _clientMobile;
  dynamic get clientEmail => _clientEmail;
  String? get callDurationInSecond => _callDurationInSecond;
  String? get callingType => _callingType;
  String? get callingTime => _callingTime;
  String? get callingDate => _callingDate;
  String? get callingPlatform => _callingPlatform;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['client_name'] = _clientName;
    map['client_mobile'] = _clientMobile;
    map['client_email'] = _clientEmail;
    map['call_duration_in_second'] = _callDurationInSecond;
    map['calling_type'] = _callingType;
    map['calling_time'] = _callingTime;
    map['calling_date'] = _callingDate;
    map['calling_platform'] = _callingPlatform;
    return map;
  }

}