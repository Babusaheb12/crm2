
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';


class DataRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  DataRepo({required this.apiClient, required this.sharedPreferences});






  bool clearSharedData() {

    apiClient.token = null;
    apiClient.updateHeader("");
    return true;
  }


}