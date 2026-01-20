class ChatUsersResponse {
  String? result;
  String? msg;
  List<UserData>? data;
  Map<String, dynamic>? roomIds;

  ChatUsersResponse({this.result, this.msg, this.data, this.roomIds});

  ChatUsersResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(UserData.fromJson(v));
      });
    }
    roomIds = json['room_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['room_ids'] = roomIds;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? role;
  String? profileImage;
  int? unreadCount;

  UserData({this.id, this.name, this.email, this.role, this.profileImage, this.unreadCount});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    profileImage = json['profile_image'];
    unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['profile_image'] = profileImage;
    data['unread_count'] = unreadCount;
    return data;
  }
}