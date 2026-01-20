/// status : "200"
/// total_count : 2

class NotificationCounterResponse {
  NotificationCounterResponse({
      String? status, 
      num? totalCount,}){
    _status = status;
    _totalCount = totalCount;
}

  NotificationCounterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalCount = json['total_count'];
  }
  String? _status;
  num? _totalCount;
NotificationCounterResponse copyWith({  String? status,
  num? totalCount,
}) => NotificationCounterResponse(  status: status ?? _status,
  totalCount: totalCount ?? _totalCount,
);
  String? get status => _status;
  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total_count'] = _totalCount;
    return map;
  }

}