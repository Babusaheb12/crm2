class ChatHistoryResponse {
  String? result;
  String? msg;
  List<ChatMessage>? data;

  ChatHistoryResponse({this.result, this.msg, this.data});

  ChatHistoryResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ChatMessage>[];
      json['data'].forEach((v) {
        data!.add(ChatMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatMessage {
  int? id;
  String? text;
  String? image;
  String? fromUser;
  String? toUser;
  String? createdAt;
  String? timeAt;

  ChatMessage(
      {this.id,
      this.text,
      this.image,
      this.fromUser,
      this.toUser,
      this.createdAt,
      this.timeAt});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    image = json['image'];
    fromUser = json['from_user'];
    toUser = json['to_user'];
    createdAt = json['created_at'];
    timeAt = json['time_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['image'] = image;
    data['from_user'] = fromUser;
    data['to_user'] = toUser;
    data['created_at'] = createdAt;
    data['time_at'] = timeAt;
    return data;
  }
}