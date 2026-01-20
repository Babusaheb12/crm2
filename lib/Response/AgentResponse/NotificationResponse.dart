/// status : "200"
/// total_count : 2
/// data : [{"id":"2","title":"22  jan 2026 party organized","message":"hen you land on a sample web page or open an email template and see content beginning with \"lorem ipsum,\" the page creator placed that apparent gibberish there on purpose.","notification_date":"2026-01-16","created":"2026-01-16 06:17 pm"},{"id":"1","title":"22  jan 2026 party organized","message":"hen you land on a sample web page or open an email template and see content beginning with \"lorem ipsum,\" the page creator placed that apparent gibberish there on purpose.","notification_date":"2026-01-16","created":"2026-01-16 06:16 pm"}]

class NotificationResponse {
  NotificationResponse({
      String? status, 
      num? totalCount, 
      List<NotificationData>? data,}){
    _status = status;
    _totalCount = totalCount;
    _data = data;
}

  NotificationResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalCount = json['total_count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NotificationData.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalCount;
  List<NotificationData>? _data;
NotificationResponse copyWith({  String? status,
  num? totalCount,
  List<NotificationData>? data,
}) => NotificationResponse(  status: status ?? _status,
  totalCount: totalCount ?? _totalCount,
  data: data ?? _data,
);
  String? get status => _status;
  num? get totalCount => _totalCount;
  List<NotificationData>? get data => _data;

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

/// id : "2"
/// title : "22  jan 2026 party organized"
/// message : "hen you land on a sample web page or open an email template and see content beginning with \"lorem ipsum,\" the page creator placed that apparent gibberish there on purpose."
/// notification_date : "2026-01-16"
/// created : "2026-01-16 06:17 pm"

class NotificationData {
  NotificationData({
      String? id, 
      String? title, 
      String? message, 
      String? notificationDate, 
      String? created,}){
    _id = id;
    _title = title;
    _message = message;
    _notificationDate = notificationDate;
    _created = created;
}

  NotificationData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _message = json['message'];
    _notificationDate = json['notification_date'];
    _created = json['created'];
  }
  String? _id;
  String? _title;
  String? _message;
  String? _notificationDate;
  String? _created;
NotificationData copyWith({  String? id,
  String? title,
  String? message,
  String? notificationDate,
  String? created,
}) => NotificationData(  id: id ?? _id,
  title: title ?? _title,
  message: message ?? _message,
  notificationDate: notificationDate ?? _notificationDate,
  created: created ?? _created,
);
  String? get id => _id;
  String? get title => _title;
  String? get message => _message;
  String? get notificationDate => _notificationDate;
  String? get created => _created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['message'] = _message;
    map['notification_date'] = _notificationDate;
    map['created'] = _created;
    return map;
  }

}