/// status : "200"
/// message : "Comment added successfully"

class AddCommentResponse {
  AddCommentResponse({
      String? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  AddCommentResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  String? _status;
  String? _message;
AddCommentResponse copyWith({  String? status,
  String? message,
}) => AddCommentResponse(  status: status ?? _status,
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