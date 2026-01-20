/// status : "200"
/// data : [{"id":"3427","set_reminder_date":"2025-04-10 09:11:00","name":"Tony Same","email":"tony@gmail.com","new_email":"","mobile":"8854842896","new_mobile":"","agent_id":"41","comment_count":"3","client_date":"2025-04-09","location":"jaipur","source":"","skype":"","status":"1","created":"2025-04-09 05:40 am","updated":"2025-04-10 09:08 am","comment_date":"2025-04-10","comment_id":"15061","client_comment":"mahendra"},{"id":"3427","set_reminder_date":"2025-04-10 09:11:00","name":"Tony Same","email":"tony@gmail.com","new_email":"","mobile":"8854842896","new_mobile":"","agent_id":"41","comment_count":"3","client_date":"2025-04-09","location":"jaipur","source":"","skype":"","status":"1","created":"2025-04-09 05:40 am","updated":"2025-04-10 09:08 am","comment_date":"2025-04-10","comment_id":"15060","client_comment":"hi user"},{"id":"3427","set_reminder_date":"2025-04-10 09:11:00","name":"Tony Same","email":"tony@gmail.com","new_email":"","mobile":"8854842896","new_mobile":"","agent_id":"41","comment_count":"3","client_date":"2025-04-09","location":"jaipur","source":"","skype":"","status":"1","created":"2025-04-09 05:40 am","updated":"2025-04-10 09:08 am","comment_date":"2025-04-10","comment_id":"15059","client_comment":"hey"}]

class WarmResponse {
  WarmResponse({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  WarmResponse.fromJson(dynamic json) {
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
WarmResponse copyWith({  String? status,
  List<Data>? data,
}) => WarmResponse(  status: status ?? _status,
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

/// id : "3427"
/// set_reminder_date : "2025-04-10 09:11:00"
/// name : "Tony Same"
/// email : "tony@gmail.com"
/// new_email : ""
/// mobile : "8854842896"
/// new_mobile : ""
/// agent_id : "41"
/// comment_count : "3"
/// client_date : "2025-04-09"
/// location : "jaipur"
/// source : ""
/// skype : ""
/// status : "1"
/// created : "2025-04-09 05:40 am"
/// updated : "2025-04-10 09:08 am"
/// comment_date : "2025-04-10"
/// comment_id : "15061"
/// client_comment : "mahendra"

class Data {
  Data({
      String? id, 
      String? setReminderDate, 
      String? name, 
      String? email, 
      String? newEmail, 
      String? mobile, 
      String? newMobile, 
      String? agentId, 
      String? commentCount, 
      String? clientDate, 
      String? location, 
      String? source, 
      String? skype, 
      String? status, 
      String? created, 
      String? updated, 
      String? commentDate, 
      String? commentId, 
      String? clientComment,}){
    _id = id;
    _setReminderDate = setReminderDate;
    _name = name;
    _email = email;
    _newEmail = newEmail;
    _mobile = mobile;
    _newMobile = newMobile;
    _agentId = agentId;
    _commentCount = commentCount;
    _clientDate = clientDate;
    _location = location;
    _source = source;
    _skype = skype;
    _status = status;
    _created = created;
    _updated = updated;
    _commentDate = commentDate;
    _commentId = commentId;
    _clientComment = clientComment;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _setReminderDate = json['set_reminder_date'];
    _name = json['name'];
    _email = json['email'];
    _newEmail = json['new_email'];
    _mobile = json['mobile'];
    _newMobile = json['new_mobile'];
    _agentId = json['agent_id'];
    _commentCount = json['comment_count'];
    _clientDate = json['client_date'];
    _location = json['location'];
    _source = json['source'];
    _skype = json['skype'];
    _status = json['status'];
    _created = json['created'];
    _updated = json['updated'];
    _commentDate = json['comment_date'];
    _commentId = json['comment_id'];
    _clientComment = json['client_comment'];
  }
  String? _id;
  String? _setReminderDate;
  String? _name;
  String? _email;
  String? _newEmail;
  String? _mobile;
  String? _newMobile;
  String? _agentId;
  String? _commentCount;
  String? _clientDate;
  String? _location;
  String? _source;
  String? _skype;
  String? _status;
  String? _created;
  String? _updated;
  String? _commentDate;
  String? _commentId;
  String? _clientComment;
Data copyWith({  String? id,
  String? setReminderDate,
  String? name,
  String? email,
  String? newEmail,
  String? mobile,
  String? newMobile,
  String? agentId,
  String? commentCount,
  String? clientDate,
  String? location,
  String? source,
  String? skype,
  String? status,
  String? created,
  String? updated,
  String? commentDate,
  String? commentId,
  String? clientComment,
}) => Data(  id: id ?? _id,
  setReminderDate: setReminderDate ?? _setReminderDate,
  name: name ?? _name,
  email: email ?? _email,
  newEmail: newEmail ?? _newEmail,
  mobile: mobile ?? _mobile,
  newMobile: newMobile ?? _newMobile,
  agentId: agentId ?? _agentId,
  commentCount: commentCount ?? _commentCount,
  clientDate: clientDate ?? _clientDate,
  location: location ?? _location,
  source: source ?? _source,
  skype: skype ?? _skype,
  status: status ?? _status,
  created: created ?? _created,
  updated: updated ?? _updated,
  commentDate: commentDate ?? _commentDate,
  commentId: commentId ?? _commentId,
  clientComment: clientComment ?? _clientComment,
);
  String? get id => _id;
  String? get setReminderDate => _setReminderDate;
  String? get name => _name;
  String? get email => _email;
  String? get newEmail => _newEmail;
  String? get mobile => _mobile;
  String? get newMobile => _newMobile;
  String? get agentId => _agentId;
  String? get commentCount => _commentCount;
  String? get clientDate => _clientDate;
  String? get location => _location;
  String? get source => _source;
  String? get skype => _skype;
  String? get status => _status;
  String? get created => _created;
  String? get updated => _updated;
  String? get commentDate => _commentDate;
  String? get commentId => _commentId;
  String? get clientComment => _clientComment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['set_reminder_date'] = _setReminderDate;
    map['name'] = _name;
    map['email'] = _email;
    map['new_email'] = _newEmail;
    map['mobile'] = _mobile;
    map['new_mobile'] = _newMobile;
    map['agent_id'] = _agentId;
    map['comment_count'] = _commentCount;
    map['client_date'] = _clientDate;
    map['location'] = _location;
    map['source'] = _source;
    map['skype'] = _skype;
    map['status'] = _status;
    map['created'] = _created;
    map['updated'] = _updated;
    map['comment_date'] = _commentDate;
    map['comment_id'] = _commentId;
    map['client_comment'] = _clientComment;
    return map;
  }

}