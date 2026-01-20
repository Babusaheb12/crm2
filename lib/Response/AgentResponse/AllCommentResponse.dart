/// status : "200"
/// data : [{"comment_id":"15025","client_id":"3418","comment":"ludo game","comment_date":"2025-03-24 05:17 pm","comment_agent_name":"Chain Singh","status":"1","created":"2025-03-24 05:17 pm","updated":"2025-03-24 05:17 pm","client_name":null,"client_mobile":null,"client_email":null,"call_duration_in_second":null,"calling_type":null,"calling_time":null,"calling_date":null,"calling_platform":"comments"},{"comment_id":"15040","client_id":"3418","comment":"Clt phone is switched off, number is not available on wa","comment_date":"2025-03-28 12:34 pm","comment_agent_name":"Mohit Patil","status":"1","created":"2025-03-28 12:34 pm","updated":"2025-03-28 12:34 pm","client_name":null,"client_mobile":null,"client_email":null,"call_duration_in_second":null,"calling_type":null,"calling_time":null,"calling_date":null,"calling_platform":"comments"},{"comment_id":"15064","client_id":"3418","comment":"Post By Mahendra","comment_date":"2025-04-11 10:30 am","comment_agent_name":"Mohit Patil","status":"1","created":"2025-04-11 10:30 am","updated":"2025-04-11 10:30 am","client_name":null,"client_mobile":null,"client_email":null,"call_duration_in_second":null,"calling_type":null,"calling_time":null,"calling_date":null,"calling_platform":"comments"},{"comment_id":"15161","client_id":"3418","comment":"","comment_date":"","comment_agent_name":"","status":"1","created":"2025-04-18 03:25 pm","updated":"2025-04-18 03:25 pm","client_name":"IndiaMART Buyer","client_mobile":"9410618854","client_email":null,"call_duration_in_second":"0","calling_type":"Outgoing","calling_time":"12:32","calling_date":"2025-03-28","calling_platform":"call"},{"comment_id":"15476","client_id":"3418","comment":"","comment_date":"","comment_agent_name":"","status":"1","created":"2025-04-18 03:30 pm","updated":"2025-04-18 03:30 pm","client_name":"IndiaMART Buyer","client_mobile":"9410618854","client_email":null,"call_duration_in_second":"0","calling_type":"Outgoing","calling_time":"12:32","calling_date":"2025-03-28","calling_platform":"call"}]

class AllCommentResponse {
  AllCommentResponse({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  AllCommentResponse.fromJson(dynamic json) {
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
AllCommentResponse copyWith({  String? status,
  List<Data>? data,
}) => AllCommentResponse(  status: status ?? _status,
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

/// comment_id : "15025"
/// client_id : "3418"
/// comment : "ludo game"
/// comment_date : "2025-03-24 05:17 pm"
/// comment_agent_name : "Chain Singh"
/// status : "1"
/// created : "2025-03-24 05:17 pm"
/// updated : "2025-03-24 05:17 pm"
/// client_name : null
/// client_mobile : null
/// client_email : null
/// call_duration_in_second : null
/// calling_type : null
/// calling_time : null
/// calling_date : null
/// calling_platform : "comments"

class Data {
  Data({
      String? commentId, 
      String? clientId, 
      String? comment, 
      String? commentDate, 
      String? commentAgentName, 
      String? status, 
      String? created, 
      String? updated, 
      dynamic clientName, 
      dynamic clientMobile, 
      dynamic clientEmail, 
      dynamic callDurationInSecond, 
      dynamic callingType, 
      dynamic callingTime, 
      dynamic callingDate, 
      String? callingPlatform,}){
    _commentId = commentId;
    _clientId = clientId;
    _comment = comment;
    _commentDate = commentDate;
    _commentAgentName = commentAgentName;
    _status = status;
    _created = created;
    _updated = updated;
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
    _commentId = json['comment_id'];
    _clientId = json['client_id'];
    _comment = json['comment'];
    _commentDate = json['comment_date'];
    _commentAgentName = json['comment_agent_name'];
    _status = json['status'];
    _created = json['created'];
    _updated = json['updated'];
    _clientName = json['client_name'];
    _clientMobile = json['client_mobile'];
    _clientEmail = json['client_email'];
    _callDurationInSecond = json['call_duration_in_second'];
    _callingType = json['calling_type'];
    _callingTime = json['calling_time'];
    _callingDate = json['calling_date'];
    _callingPlatform = json['calling_platform'];
  }
  String? _commentId;
  String? _clientId;
  String? _comment;
  String? _commentDate;
  String? _commentAgentName;
  String? _status;
  String? _created;
  String? _updated;
  dynamic _clientName;
  dynamic _clientMobile;
  dynamic _clientEmail;
  dynamic _callDurationInSecond;
  dynamic _callingType;
  dynamic _callingTime;
  dynamic _callingDate;
  String? _callingPlatform;
Data copyWith({  String? commentId,
  String? clientId,
  String? comment,
  String? commentDate,
  String? commentAgentName,
  String? status,
  String? created,
  String? updated,
  dynamic clientName,
  dynamic clientMobile,
  dynamic clientEmail,
  dynamic callDurationInSecond,
  dynamic callingType,
  dynamic callingTime,
  dynamic callingDate,
  String? callingPlatform,
}) => Data(  commentId: commentId ?? _commentId,
  clientId: clientId ?? _clientId,
  comment: comment ?? _comment,
  commentDate: commentDate ?? _commentDate,
  commentAgentName: commentAgentName ?? _commentAgentName,
  status: status ?? _status,
  created: created ?? _created,
  updated: updated ?? _updated,
  clientName: clientName ?? _clientName,
  clientMobile: clientMobile ?? _clientMobile,
  clientEmail: clientEmail ?? _clientEmail,
  callDurationInSecond: callDurationInSecond ?? _callDurationInSecond,
  callingType: callingType ?? _callingType,
  callingTime: callingTime ?? _callingTime,
  callingDate: callingDate ?? _callingDate,
  callingPlatform: callingPlatform ?? _callingPlatform,
);
  String? get commentId => _commentId;
  String? get clientId => _clientId;
  String? get comment => _comment;
  String? get commentDate => _commentDate;
  String? get commentAgentName => _commentAgentName;
  String? get status => _status;
  String? get created => _created;
  String? get updated => _updated;
  dynamic get clientName => _clientName;
  dynamic get clientMobile => _clientMobile;
  dynamic get clientEmail => _clientEmail;
  dynamic get callDurationInSecond => _callDurationInSecond;
  dynamic get callingType => _callingType;
  dynamic get callingTime => _callingTime;
  dynamic get callingDate => _callingDate;
  String? get callingPlatform => _callingPlatform;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment_id'] = _commentId;
    map['client_id'] = _clientId;
    map['comment'] = _comment;
    map['comment_date'] = _commentDate;
    map['comment_agent_name'] = _commentAgentName;
    map['status'] = _status;
    map['created'] = _created;
    map['updated'] = _updated;
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