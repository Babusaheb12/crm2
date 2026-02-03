/// status : "200"
/// data : {"total_users":8,"total_clients":1450,"total_warm_clients":178,"total_cold_clients":300,"total_dead_clients":969,"total_sleep_clients":0,"total_important_clients":1,"total_current_month_clients":9,"get_total_followup_clients":3,"type":"manager"}

class Dashboard {
  Dashboard({
      String? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  Dashboard.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Data? _data;
Dashboard copyWith({  String? status,
  Data? data,
}) => Dashboard(  status: status ?? _status,
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

/// total_users : 8
/// total_clients : 1450
/// total_warm_clients : 178
/// total_cold_clients : 300
/// total_dead_clients : 969
/// total_sleep_clients : 0
/// total_important_clients : 1
/// total_current_month_clients : 9
/// get_total_followup_clients : 3
/// type : "manager"

class Data {
  Data({
      num? totalUsers, 
      num? totalClients, 
      num? totalWarmClients, 
      num? totalColdClients, 
      num? totalDeadClients, 
      num? totalSleepClients, 
      num? totalImportantClients, 
      num? totalCurrentMonthClients, 
      num? getTotalFollowupClients,
      // HR Dashboard fields
      num? totalCandidate,
      num? currentMonthTotalCandidate,
      num? shortlistedCandidate,
      num? interviewedCandidate,
      num? selectedCandidate,
      num? rejectedCandidate,
      String? type,
      String? role,}){
    _totalUsers = totalUsers;
    _totalClients = totalClients;
    _totalWarmClients = totalWarmClients;
    _totalColdClients = totalColdClients;
    _totalDeadClients = totalDeadClients;
    _totalSleepClients = totalSleepClients;
    _totalImportantClients = totalImportantClients;
    _totalCurrentMonthClients = totalCurrentMonthClients;
    _getTotalFollowupClients = getTotalFollowupClients;
    // HR Dashboard fields
    _totalCandidate = totalCandidate;
    _currentMonthTotalCandidate = currentMonthTotalCandidate;
    _shortlistedCandidate = shortlistedCandidate;
    _interviewedCandidate = interviewedCandidate;
    _selectedCandidate = selectedCandidate;
    _rejectedCandidate = rejectedCandidate;
    _type = type;
    _role = role;
}

  Data.fromJson(dynamic json) {
    _totalUsers = json['total_users'];
    _totalClients = json['total_clients'];
    _totalWarmClients = json['total_warm_clients'];
    _totalColdClients = json['total_cold_clients'];
    _totalDeadClients = json['total_dead_clients'];
    _totalSleepClients = json['total_sleep_clients'];
    _totalImportantClients = json['total_important_clients'];
    _totalCurrentMonthClients = json['total_current_month_clients'];
    _getTotalFollowupClients = json['get_total_followup_clients'];
    // HR Dashboard fields
    _totalCandidate = json['total_candidate'];
    _currentMonthTotalCandidate = json['current_month_total_candidate'];
    _shortlistedCandidate = json['shortlisted_candidate'];
    _interviewedCandidate = json['interviewed_candidate'];
    _selectedCandidate = json['selected_candidate'];
    _rejectedCandidate = json['rejected_candidate'];
    _type = json['type'];
    _role = json['role'];
  }
  num? _totalUsers;
  num? _totalClients;
  num? _totalWarmClients;
  num? _totalColdClients;
  num? _totalDeadClients;
  num? _totalSleepClients;
  num? _totalImportantClients;
  num? _totalCurrentMonthClients;
  num? _getTotalFollowupClients;
  // HR Dashboard fields
  num? _totalCandidate;
  num? _currentMonthTotalCandidate;
  num? _shortlistedCandidate;
  num? _interviewedCandidate;
  num? _selectedCandidate;
  num? _rejectedCandidate;
  String? _type;
  String? _role;
Data copyWith({  num? totalUsers,
  num? totalClients,
  num? totalWarmClients,
  num? totalColdClients,
  num? totalDeadClients,
  num? totalSleepClients,
  num? totalImportantClients,
  num? totalCurrentMonthClients,
  num? getTotalFollowupClients,
  // HR Dashboard fields
  num? totalCandidate,
  num? currentMonthTotalCandidate,
  num? shortlistedCandidate,
  num? interviewedCandidate,
  num? selectedCandidate,
  num? rejectedCandidate,
  String? type,
  String? role,
}) => Data(  totalUsers: totalUsers ?? _totalUsers,
  totalClients: totalClients ?? _totalClients,
  totalWarmClients: totalWarmClients ?? _totalWarmClients,
  totalColdClients: totalColdClients ?? _totalColdClients,
  totalDeadClients: totalDeadClients ?? _totalDeadClients,
  totalSleepClients: totalSleepClients ?? _totalSleepClients,
  totalImportantClients: totalImportantClients ?? _totalImportantClients,
  totalCurrentMonthClients: totalCurrentMonthClients ?? _totalCurrentMonthClients,
  getTotalFollowupClients: getTotalFollowupClients ?? _getTotalFollowupClients,
  // HR Dashboard fields
  totalCandidate: totalCandidate ?? _totalCandidate,
  currentMonthTotalCandidate: currentMonthTotalCandidate ?? _currentMonthTotalCandidate,
  shortlistedCandidate: shortlistedCandidate ?? _shortlistedCandidate,
  interviewedCandidate: interviewedCandidate ?? _interviewedCandidate,
  selectedCandidate: selectedCandidate ?? _selectedCandidate,
  rejectedCandidate: rejectedCandidate ?? _rejectedCandidate,
  type: type ?? _type,
  role: role ?? _role,
);
  num? get totalUsers => _totalUsers;
  num? get totalClients => _totalClients;
  num? get totalWarmClients => _totalWarmClients;
  num? get totalColdClients => _totalColdClients;
  num? get totalDeadClients => _totalDeadClients;
  num? get totalSleepClients => _totalSleepClients;
  num? get totalImportantClients => _totalImportantClients;
  num? get totalCurrentMonthClients => _totalCurrentMonthClients;
  num? get getTotalFollowupClients => _getTotalFollowupClients;
  // HR Dashboard getters
  num? get totalCandidate => _totalCandidate;
  num? get currentMonthTotalCandidate => _currentMonthTotalCandidate;
  num? get shortlistedCandidate => _shortlistedCandidate;
  num? get interviewedCandidate => _interviewedCandidate;
  num? get selectedCandidate => _selectedCandidate;
  num? get rejectedCandidate => _rejectedCandidate;
  String? get type => _type;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_users'] = _totalUsers;
    map['total_clients'] = _totalClients;
    map['total_warm_clients'] = _totalWarmClients;
    map['total_cold_clients'] = _totalColdClients;
    map['total_dead_clients'] = _totalDeadClients;
    map['total_sleep_clients'] = _totalSleepClients;
    map['total_important_clients'] = _totalImportantClients;
    map['total_current_month_clients'] = _totalCurrentMonthClients;
    map['get_total_followup_clients'] = _getTotalFollowupClients;
    // HR Dashboard fields
    map['total_candidate'] = _totalCandidate;
    map['current_month_total_candidate'] = _currentMonthTotalCandidate;
    map['shortlisted_candidate'] = _shortlistedCandidate;
    map['interviewed_candidate'] = _interviewedCandidate;
    map['selected_candidate'] = _selectedCandidate;
    map['rejected_candidate'] = _rejectedCandidate;
    map['type'] = _type;
    map['role'] = _role;
    return map;
  }

}