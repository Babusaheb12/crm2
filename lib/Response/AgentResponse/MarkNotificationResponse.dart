/// status : "200"
/// message : "Notification marked as read successfully"

class MarkNotificationResponse {
  MarkNotificationResponse({
      String? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  MarkNotificationResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  String? _status;
  String? _message;
MarkNotificationResponse copyWith({  String? status,
  String? message,
}) => MarkNotificationResponse(  status: status ?? _status,
  message: message ?? _message,
);
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}