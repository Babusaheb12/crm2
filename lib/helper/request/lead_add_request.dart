class AddLeadRequest {
  String? userID;
  String? name;
  String? phone;
  String? email;
  String? group;
  String? description;
  String? leadStatus;
  String? source;
  String? assigned;


  AddLeadRequest(
      {this.userID,
        this.name,
        this.phone,
        this.email,
        this.group,
        this.description,
        this.leadStatus,
        this.source,
        this.assigned,

      });

  AddLeadRequest.fromJson(Map<String, dynamic> json) {
    userID = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    group = json['group'];
    description = json['description'];
    leadStatus = json['lead_status'];
    source = json['source'];
    assigned = json['assigned'];

  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['user_id'] = userID!;
    data['name'] = name!;
    data['phone'] = phone!;
    data['email'] = email!;
    data['group'] = group!;
    data['description'] = description!;
    data['lead_status'] = leadStatus!;
    data['source'] = source!;
    data['assigned'] = assigned!;

    return data;
  }
}
