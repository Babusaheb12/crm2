

import 'package:crm/helper/request/lead_add_request.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/AppConstants.dart';
import '../helper/api.dart';
import '../helper/api_client.dart';

class APIRepo {
   ApiClient? apiClient;
   SharedPreferences? sharedPreferences;
   APIRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getLeadList(String page,String status,String userID) async {
    return await apiClient!.postData('${APIController.leadListURL}?page=$page',{"user_id":userID,"status":status});
  }

  Future<Response> addLeadData(AddLeadRequest request )
  async {
    return await apiClient!.postData(APIController.addLeadURL, request.toJson());
  }

   Future<Response> login(String email,String password) async {
     return await apiClient!.postData(APIController.leadListURL,{"email":email,"password":password});
   }




}