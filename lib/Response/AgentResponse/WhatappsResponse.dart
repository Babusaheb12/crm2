/// status : "200"
/// message : "Data added successfully"

class WhatappsResponse {
  WhatappsResponse({
      String? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  WhatappsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  String? _status;
  String? _message;
WhatappsResponse copyWith({  String? status,
  String? message,
}) => WhatappsResponse(  status: status ?? _status,
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