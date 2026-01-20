/// status : "200"
/// total_count : 2
/// data : [{"id":"3422","assign_to":"Chain Singh","set_reminder_date":"","name":"Mukesh Verma","email":"","new_email":"","mobile":"8048955421","new_mobile":"","agent_id":"43","comment_count":"1","client_date":"2025-04-01","location":"Saharanpur,Uttar Pradesh","source":"india mart","skype":"","status":"1","created":"2025-04-01 03:49 pm","updated":"2025-04-01 03:49 pm","comment_date":"2025-04-01","comment_id":"15045","client_comment":"I am interested in your product and services. Please send us quotation & details"}]

class FlowupResponse {
  FlowupResponse({
      String? status, 
      num? totalCount, 
      List<Data>? data,}){
    _status = status;
    _totalCount = totalCount;
    _data = data;
}

  FlowupResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalCount = json['total_count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalCount;
  List<Data>? _data;
FlowupResponse copyWith({  String? status,
  num? totalCount,
  List<Data>? data,
}) => FlowupResponse(  status: status ?? _status,
  totalCount: totalCount ?? _totalCount,
  data: data ?? _data,
);
  String? get status => _status;
  num? get totalCount => _totalCount;
  List<Data>? get data => _data;

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

/// id : "3422"
/// assign_to : "Chain Singh"
/// set_reminder_date : ""
/// name : "Mukesh Verma"
/// email : ""
/// new_email : ""
/// mobile : "8048955421"
/// new_mobile : ""
/// agent_id : "43"
/// comment_count : "1"
/// client_date : "2025-04-01"
/// location : "Saharanpur,Uttar Pradesh"
/// source : "india mart"
/// skype : ""
/// status : "1"
/// created : "2025-04-01 03:49 pm"
/// updated : "2025-04-01 03:49 pm"
/// comment_date : "2025-04-01"
/// comment_id : "15045"
/// client_comment : "I am interested in your product and services. Please send us quotation & details"

class Data {
  Data({
      String? id, 
      String? assignTo, 
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
    _assignTo = assignTo;
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
    _assignTo = json['assign_to'];
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
  String? _assignTo;
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
  String? assignTo,
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
  assignTo: assignTo ?? _assignTo,
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
  String? get assignTo => _assignTo;
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
    map['assign_to'] = _assignTo;
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