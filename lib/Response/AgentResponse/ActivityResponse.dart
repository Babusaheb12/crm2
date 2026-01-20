/// status : "200"
/// data : {"total_phone_call":19,"total_phone_call_duration":"35m 59s","total_incomming_phone_call":1,"total_incomming_call_duration":"1m 14s","total_outgoing_phone_call":15,"total_outgoing_call_duration":"34m 16s","total_missed_phone_call":1,"total_missed_call_duration":"29s","total_rejected_phone_call":0,"total_rejected_call_duration":"0h 0m 0s","from_date":"2025-01-16","to_date":"2025-04-16","agent_id":"39"}

class ActivityResponse {
  ActivityResponse({
      String? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  ActivityResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Data? _data;
ActivityResponse copyWith({  String? status,
  Data? data,
}) => ActivityResponse(  status: status ?? _status,
  data: data ?? _data,
);
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// total_phone_call : 19
/// total_phone_call_duration : "35m 59s"
/// total_incomming_phone_call : 1
/// total_incomming_call_duration : "1m 14s"
/// total_outgoing_phone_call : 15
/// total_outgoing_call_duration : "34m 16s"
/// total_missed_phone_call : 1
/// total_missed_call_duration : "29s"
/// total_rejected_phone_call : 0
/// total_rejected_call_duration : "0h 0m 0s"
/// from_date : "2025-01-16"
/// to_date : "2025-04-16"
/// agent_id : "39"

class Data {
  Data({
      num? totalPhoneCall, 
      String? totalPhoneCallDuration, 
      num? totalIncommingPhoneCall, 
      String? totalIncommingCallDuration, 
      num? totalOutgoingPhoneCall, 
      String? totalOutgoingCallDuration, 
      num? totalMissedPhoneCall, 
      String? totalMissedCallDuration, 
      num? totalRejectedPhoneCall, 
      String? totalRejectedCallDuration, 
      String? fromDate, 
      String? toDate, 
      String? agentId,}){
    _totalPhoneCall = totalPhoneCall;
    _totalPhoneCallDuration = totalPhoneCallDuration;
    _totalIncommingPhoneCall = totalIncommingPhoneCall;
    _totalIncommingCallDuration = totalIncommingCallDuration;
    _totalOutgoingPhoneCall = totalOutgoingPhoneCall;
    _totalOutgoingCallDuration = totalOutgoingCallDuration;
    _totalMissedPhoneCall = totalMissedPhoneCall;
    _totalMissedCallDuration = totalMissedCallDuration;
    _totalRejectedPhoneCall = totalRejectedPhoneCall;
    _totalRejectedCallDuration = totalRejectedCallDuration;
    _fromDate = fromDate;
    _toDate = toDate;
    _agentId = agentId;
}

  Data.fromJson(dynamic json) {
    _totalPhoneCall = json['total_phone_call'];
    _totalPhoneCallDuration = json['total_phone_call_duration'];
    _totalIncommingPhoneCall = json['total_incomming_phone_call'];
    _totalIncommingCallDuration = json['total_incomming_call_duration'];
    _totalOutgoingPhoneCall = json['total_outgoing_phone_call'];
    _totalOutgoingCallDuration = json['total_outgoing_call_duration'];
    _totalMissedPhoneCall = json['total_missed_phone_call'];
    _totalMissedCallDuration = json['total_missed_call_duration'];
    _totalRejectedPhoneCall = json['total_rejected_phone_call'];
    _totalRejectedCallDuration = json['total_rejected_call_duration'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _agentId = json['agent_id'];
  }
  num? _totalPhoneCall;
  String? _totalPhoneCallDuration;
  num? _totalIncommingPhoneCall;
  String? _totalIncommingCallDuration;
  num? _totalOutgoingPhoneCall;
  String? _totalOutgoingCallDuration;
  num? _totalMissedPhoneCall;
  String? _totalMissedCallDuration;
  num? _totalRejectedPhoneCall;
  String? _totalRejectedCallDuration;
  String? _fromDate;
  String? _toDate;
  String? _agentId;
Data copyWith({  num? totalPhoneCall,
  String? totalPhoneCallDuration,
  num? totalIncommingPhoneCall,
  String? totalIncommingCallDuration,
  num? totalOutgoingPhoneCall,
  String? totalOutgoingCallDuration,
  num? totalMissedPhoneCall,
  String? totalMissedCallDuration,
  num? totalRejectedPhoneCall,
  String? totalRejectedCallDuration,
  String? fromDate,
  String? toDate,
  String? agentId,
}) => Data(  totalPhoneCall: totalPhoneCall ?? _totalPhoneCall,
  totalPhoneCallDuration: totalPhoneCallDuration ?? _totalPhoneCallDuration,
  totalIncommingPhoneCall: totalIncommingPhoneCall ?? _totalIncommingPhoneCall,
  totalIncommingCallDuration: totalIncommingCallDuration ?? _totalIncommingCallDuration,
  totalOutgoingPhoneCall: totalOutgoingPhoneCall ?? _totalOutgoingPhoneCall,
  totalOutgoingCallDuration: totalOutgoingCallDuration ?? _totalOutgoingCallDuration,
  totalMissedPhoneCall: totalMissedPhoneCall ?? _totalMissedPhoneCall,
  totalMissedCallDuration: totalMissedCallDuration ?? _totalMissedCallDuration,
  totalRejectedPhoneCall: totalRejectedPhoneCall ?? _totalRejectedPhoneCall,
  totalRejectedCallDuration: totalRejectedCallDuration ?? _totalRejectedCallDuration,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  agentId: agentId ?? _agentId,
);
  num? get totalPhoneCall => _totalPhoneCall;
  String? get totalPhoneCallDuration => _totalPhoneCallDuration;
  num? get totalIncommingPhoneCall => _totalIncommingPhoneCall;
  String? get totalIncommingCallDuration => _totalIncommingCallDuration;
  num? get totalOutgoingPhoneCall => _totalOutgoingPhoneCall;
  String? get totalOutgoingCallDuration => _totalOutgoingCallDuration;
  num? get totalMissedPhoneCall => _totalMissedPhoneCall;
  String? get totalMissedCallDuration => _totalMissedCallDuration;
  num? get totalRejectedPhoneCall => _totalRejectedPhoneCall;
  String? get totalRejectedCallDuration => _totalRejectedCallDuration;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get agentId => _agentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_phone_call'] = _totalPhoneCall;
    map['total_phone_call_duration'] = _totalPhoneCallDuration;
    map['total_incomming_phone_call'] = _totalIncommingPhoneCall;
    map['total_incomming_call_duration'] = _totalIncommingCallDuration;
    map['total_outgoing_phone_call'] = _totalOutgoingPhoneCall;
    map['total_outgoing_call_duration'] = _totalOutgoingCallDuration;
    map['total_missed_phone_call'] = _totalMissedPhoneCall;
    map['total_missed_call_duration'] = _totalMissedCallDuration;
    map['total_rejected_phone_call'] = _totalRejectedPhoneCall;
    map['total_rejected_call_duration'] = _totalRejectedCallDuration;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['agent_id'] = _agentId;
    return map;
  }

}