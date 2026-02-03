class CandidateListResponse {
  final String status;
  final int totalCount;
  final List<CandidateData> data;

  CandidateListResponse({
    required this.status,
    required this.totalCount,
    required this.data,
  });

  factory CandidateListResponse.fromJson(Map<String, dynamic> json) {
    return CandidateListResponse(
      status: json['status'].toString(),
      totalCount: json['total_count'] is String 
          ? int.parse(json['total_count']) 
          : json['total_count'] as int,
      data: (json['data'] as List)
          .map((item) => CandidateData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'total_count': totalCount,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class CandidateData {
  final String id;
  final String name;
  final String email;
  final String number;
  final String countryCode;
  final String countryName;
  final String position;
  final String exp;
  final String? currentCompany;
  final String? resume;
  final String? location;
  final String? source;
  final String? interviewDate;
  final String? currentCtc;
  final String? expectedCtc;
  final String? remark;
  final String? status;
  final String? created;

  CandidateData({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.countryCode,
    required this.countryName,
    required this.position,
    required this.exp,
    this.currentCompany,
    this.resume,
    this.location,
    this.source,
    this.interviewDate,
    this.currentCtc,
    this.expectedCtc,
    this.remark,
    this.status,
    this.created,
  });

  factory CandidateData.fromJson(Map<String, dynamic> json) {
    return CandidateData(
      id: json['id'].toString(),
      name: json['name'].toString(),
      email: json['email'].toString(),
      number: json['number'].toString(),
      countryCode: json['country_code'].toString(),
      countryName: json['country_name'].toString(),
      position: json['position'].toString(),
      exp: json['exp'].toString(),
      currentCompany: json['current_company']?.toString(),
      resume: json['resume']?.toString(),
      location: json['location']?.toString(),
      source: json['source']?.toString(),
      interviewDate: json['interview_date']?.toString(),
      currentCtc: json['current_ctc']?.toString(),
      expectedCtc: json['expected_ctc']?.toString(),
      remark: json['remark']?.toString(),
      status: json['status']?.toString(),
      created: json['created']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'number': number,
      'country_code': countryCode,
      'country_name': countryName,
      'position': position,
      'exp': exp,
      'current_company': currentCompany,
      'resume': resume,
      'location': location,
      'source': source,
      'interview_date': interviewDate,
      'current_ctc': currentCtc,
      'expected_ctc': expectedCtc,
      'remark': remark,
      'status': status,
      'created': created,
    };
  }
}