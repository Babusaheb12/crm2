import 'dart:io';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api.dart';
import '../../api/api_client.dart';
import '../../util/app_constants.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login({required String email,required String? password}) async {
    return await apiClient.postData(
        ApiUrls.Signin, {
          "email": email!,
      "password": password!,
    });
  }

  Future<Response> Dashboards({
    required String type,
  })
  async {
    return await apiClient.postData(
        ApiUrls.dashboard, {
          "type": type!,
    });
  }

  Future<Response> AddClient({
    required String name,
    required String email,
    required String new_email,
    required String mobile,
    required String new_mobile,
    required String location,
    required String source,
    required String skype,
    required String comment,
  }) async {
    return await apiClient.postData(
        ApiUrls.Addclient, {
          "name": name!,
          "email": email!,
          "new_email": new_email!,
          "mobile": mobile!,
          "new_mobile": new_mobile!,
          "location": location!,
          "source": source!,
          "skype": skype!,
          "comment": comment!,
    });
  }

  Future<Response> UpdateClient({
    required String client_id,
    required String name,
    required String email,
    required String new_email,
    required String mobile,
    required String new_mobile,
    required String location,
    required String source,
    required String skype,
    required String comment,
  }) async {
    return await apiClient.postData(
        ApiUrls.Updateclient, {
          "client_id": client_id!,
          "name": name!,
          "email": email!,
          "new_email": new_email!,
          "mobile": mobile!,
          "new_mobile": new_mobile!,
          "location": location!,
          "source": source!,
          "skype": skype!,
          "source": source!,
    });
  }

  Future<Response> ChangeStatus({
    required String client_id,
    required String status,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Changestatus, {
          "client_id": client_id!,
          "status": status!,

    });
  }

  Future<Response> Allcomments({
    required String client_id,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Allcomments, {
          "client_id": client_id!,

    });
  }

  Future<Response> ClientDetails({
    required String client_id,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Clientdetails, {
          "client_id": client_id!,

    });
  }

  Future<Response> SetReminder({
    required String client_id,
    required String reminder_date,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Setreminder, {
          "client_id": client_id!,
          "reminder_date": reminder_date!,

    });
  }

  Future<Response> AddWhatapps({
    required String client_id,
    required String whatsapp_count,
    required String calling_date,
    required String calling_time,
    required String client_mobile,
    required String client_name,
    required String calling_platform,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Whatapps, {
      "client_id": client_id!,
      "whatsapp_count": whatsapp_count!,
      "calling_date": calling_date!,
      "calling_time": calling_time!,
      "client_mobile": client_mobile!,
      "client_name": client_name!,
      "calling_platform": calling_platform!,

    });
  }

  Future<Response> AddCall({
    required String client_id,
    required String calling_count,
    required String calling_date,
    required String calling_time,
    required String client_mobile,
    required String client_name,
    required String calling_platform,
    required String calling_type,
    required String call_duration_in_second,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Call, {
      "client_id": client_id!,
      "calling_count": calling_count!,
      "calling_date": calling_date!,
      "calling_time": calling_time!,
      "client_mobile": client_mobile!,
      "client_name": client_name!,
      "calling_platform": calling_platform!,
      "calling_type": calling_type!,

    });
  }

  Future<Response> AddGmails({
    required String client_id,
    required String gmail_count,
    required String calling_date,
    required String calling_time,
    required String client_mobile,
    required String client_email,
    required String client_name,
    required String calling_platform,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Addgmails, {
      "client_id": client_id!,
      "gmail_count": gmail_count!,
      "calling_date": calling_date!,
      "calling_time": calling_time!,
      "client_mobile": client_mobile!,
      "client_email": client_email!,
      "client_name": client_name!,
      "calling_platform": calling_platform!,


    });
  }

  Future<Response> AddComment({
    required String client_id,
    required String comment,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Allcomment, {
      "client_id": client_id!,
      "comment": comment!,


    });
  }

  Future<Response> Profile() async {
    return await apiClient.getData(
        ApiUrls.ProfileData);
  }

  Future<Response> AllClient({
    required String fname,
    required String mobile,
    required String email,
    required String from_date,
    required String to_date,
    required String last_date,
    required String search,
    required String status,
    required String location,
    required String source,
    required String limit,
    required String offset,
    required String agent_id,
  })
  async {
    return await apiClient.postData(
        ApiUrls.Allclient, {
      "fname": fname!,
      "mobile": mobile!,
      "email": email!,
      "from_date": from_date!,
      "to_date": to_date!,
      "last_date": last_date!,
      "search": search!,
      "status": status!,
      "location": location!,
      "source": source!,
      "limit": limit!,
      "offset": offset!,
      "agent_id": agent_id!,
    });
  }

  Future<Response> FlowupClient({
    required String name,
    required String mobile,
    required String email,
    required String from_date,
    required String to_date,
    required String last_date,
    required String search,
    required String status,
    required String location,
    required String source,
    required String limit,
    required String offset,
    required String agent_id,
  })
  async {
    return await apiClient.postData(
        ApiUrls.flowupClient, {
      "name": name!,
      "mobile": mobile!,
      "email": email!,
      "from_date": from_date!,
      "to_date": to_date!,
      "last_date": last_date!,
      "search": search!,
      "status": status!,
      "location": location!,
      "source": source!,
      "limit": limit!,
      "offset": offset!,
      "agent_id": agent_id!,
    });
  }

  Future<Response> AllUser({
    required String name,
    required String mobile,
    required String email,
    required String status,
    required String limit,
    required String offset,
  })
  async {
    return await apiClient.postData(
        ApiUrls.AllUserList, {
      "name": name!,
      "mobile": mobile!,
      "email": email!,
      "status": status!,
      "limit": limit!,
      "offset": offset!,
    });
  }

  Future<Response> AllActivity({
    required String from_date,
    required String to_date,
    required String agent_id,

  })
  async {
    return await apiClient.postData(
        ApiUrls.Allactivity, {
      "from_date": from_date!,
      "to_date": to_date!,
      "agent_id": agent_id!,

    });
  }

  Future<Response> DetailsActivity({
    required String from_date,
    required String to_date,
    required String agent_id,
    required String calling_type,

  })
  async {
    return await apiClient.postData(
        ApiUrls.AllDetailsactivity, {
      "from_date": from_date!,
      "to_date": to_date!,
      "agent_id": agent_id!,
      "calling_type": calling_type!,

    });
  }

  Future<Response> CallHistory({
    required String name,
    required String mobile,
    required String email,
    required String from_date,
    required String to_date,
    required String client_id,
    required String calling_platform,
    required String calling_type,
    required String search,
  })
  async {
    return await apiClient.postData(
        ApiUrls.Callhistory, {
      "name": name!,
      "mobile": mobile!,
      "email": email!,
      "from_date": from_date!,
      "to_date": to_date!,
      "client_id": client_id!,
      "calling_platform": calling_platform!,
      "calling_type": calling_type!,
      "search": search!,
    });
  }


  Future<Response> CallMultiPle({
    required List<Map<String, dynamic>> multiplecallData, // updated param
  }) async {
    return await apiClient.postData(
      ApiUrls.MultipleCall,
      {
        "data": multiplecallData, // sending in required format
      },
    );
  }


  Future<Response> getAllChatUsers(int userId) async {
    print('API Call: ${ApiUrls.ChatAlluser} with userId: $userId');
    Response response = await apiClient.postDataOther(
        ApiUrls.ChatAlluser, // This uses the full URL with BASE_URL2
        {
          "user_id": userId,
        },
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    print('API Response received: Status ${response.statusCode}');
    return response;
  }

  Future<Response> getChatHistory({required int user2, required int id}) async {
    print('API Call: ${ApiUrls.ChatHistory} with user2: $user2, id: $id');
    Response response = await apiClient.postDataOther(
        ApiUrls.ChatHistory,
        {
          "user1": id,      // from user id
          "user2": user2,    // to user id 
          "id": id,         // login user id
        },
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    print('API Response received: Status ${response.statusCode}');
    return response;
  }

  Future<bool>saveUserPassword(String password)
  async{
    return await sharedPreferences.setString(password, password);
  }


  Future<bool> saveUserToken(String token, [int? userId]) async {
    apiClient.token = token;
    apiClient.updateHeader(
        token);
    await sharedPreferences.setString(AppContants.token, token);
    
    // Save user ID if provided
    if (userId != null) {
      await sharedPreferences.setInt('user_id', userId);
    }
    
    return true;
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppContants.token);
  }

  bool clearSharedData() {

    apiClient.token = null;
    sharedPreferences.clear();
    apiClient.updateHeader("");
    return true;
  }

  Future<Response> uploadChatImage(String imagePath) async {
    print('API Call: Uploading image to ${ApiUrls.chatImageUpload}');
    
    Response response = await apiClient.uploadImage(
      ApiUrls.chatImageUpload,
      imagePath,
    );
    
    print('Image Upload API Response: Status ${response.statusCode}, Body: ${response.body}');
    return response;
  }
  
  Future<Response> getAllNotifications() async {
    print('API Request: Getting all notifications from ${ApiUrls.AllNotification}');
    Response response = await apiClient.getData(
        ApiUrls.AllNotification);
    print('API Response: getAllNotifications - Status: ${response.statusCode}, Body: ${response.body}');
    return response;
  }
  
  Future<Response> getNotificationCount() async {
    print('API Request: Getting notification count from ${ApiUrls.AllNotificationCounter}');
    Response response = await apiClient.getData(
        ApiUrls.AllNotificationCounter);
    print('API Response: getNotificationCount - Status: ${response.statusCode}, Body: ${response.body}');
    return response;
  }
  
  Future<Response> markAllNotificationRead() async {
    print('API Request: Marking all notifications as read from ${ApiUrls.MarkNotification}');
    Response response = await apiClient.getData(
        ApiUrls.MarkNotification);
    print('API Response: markAllNotificationRead - Status: ${response.statusCode}, Body: ${response.body}');
    return response;
  }
}