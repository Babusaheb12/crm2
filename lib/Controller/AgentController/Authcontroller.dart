import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

import '../../Screens/Home/MainHomePage.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../Repo/AgentRepo/Authrepo.dart';
import '../../Response/AgentResponse/ActivityDetailsResponse.dart';
import '../../Response/AgentResponse/ActivityResponse.dart';
import '../../Response/AgentResponse/AddClientResponse.dart';
import '../../Response/AgentResponse/AddUserResponse.dart';
import '../../Response/AgentResponse/AllHrUserResponse.dart';
import '../../Response/AgentResponse/AddCommentResponse.dart';
import '../../Response/AgentResponse/AllClientResponse.dart';
import '../../Response/AgentResponse/AllCommentResponse.dart';
import '../../Response/AgentResponse/AllUserResponse.dart';
import '../../Response/AgentResponse/CallHistoryResponse.dart';
import '../../Response/AgentResponse/CallResponse.dart';
import '../../Response/AgentResponse/ChangeStatusResponse.dart';
import '../../Response/AgentResponse/NotificationResponse.dart';
import '../../Response/AgentResponse/NotificationCounterResponse.dart';
import '../../Response/AgentResponse/ClientDetailsResponse.dart';
import '../../Response/AgentResponse/FlowupResponse.dart';
import '../../Response/AgentResponse/GmailResponse.dart';
import '../../Response/AgentResponse/LoginResponse.dart';
import '../../Response/AgentResponse/MultipleCallResponse.dart';
import '../../Response/AgentResponse/ProfileResponse.dart';
import '../../Response/AgentResponse/ReminderResponse.dart';
import '../../Response/AgentResponse/UpdateClientResponse.dart';
import '../../Response/AgentResponse/WhatappsResponse.dart';
import '../../Response/AgentResponse/dashboard.dart';
import '../../Screens/Auth/LoginPage.dart';
import '../../Screens/Home/MainHomePage.dart';
import '../../Screens/Home/RoleDashboard/manager/HrUser.dart';
import '../../Screens/Home/RoleDashboard/manager/devloperManager.dart';
import '../../Screens/Home/ViewActivity.dart';
import '../../Screens/Home/RoleDashboard/manager/hrDashboard.dart';
import '../../util/custom_snackbar.dart';
import '../DashboardController.dart';

class AuthController extends GetxController implements GetxService {
  AuthRepo Repo;

  AuthController({required this.Repo});

  bool isLoading19 = false;
  bool isLoading18 = false;
  bool isLoading17 = false;
  bool isLoading16 = false;
  bool isLoading15 = false;
  bool isLoading14 = false;
  bool isLoading13 = false;
  bool isLoading12 = false;
  bool isLoading11 = false;
  bool isLoading10 = false;
  bool isLoading9 = false;
  bool isLoading8 = false;
  bool isLoading7 = false;
  bool isLoading6 = false;
  bool isLoading5 = false;
  bool isLoading4 = false;
  bool isLoading3 = false;
  bool isLoading2 = false;
  bool isLoading1 = false;
  bool isLoading = false;
  bool initialNavigationCompleted = false;

  LoginResponse? loginResponse = LoginResponse();
  Future<void> LoginResponceFunction(String email, String password) async {
    isLoading1 = true;
    update();
    Response response = await Repo.login(email: email!, password: password!);
    print('response.body=>${response.body}');
    if (response.body["status"] == '200') {
      Repo.saveUserPassword(password);
      loginResponse = LoginResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: false,
      );
      // Extract user ID from the response and save it along with the token
      int? userId = int.tryParse(
        response.body["data"]["userid"]?.toString() ?? "0",
      );
      Repo.saveUserToken(response.body["data"]["token"], userId);

      // Save user type and role
      String userType = response.body["data"]["type"]?.toString() ?? "";
      String userRole = response.body["data"]["role"]?.toString() ?? "";
      Repo.saveUserTypeAndRole(userType, userRole);
      print("✅ Saved user type: $userType, role: $userRole");

      // Reset the navigation flag so that GetDashboard can handle navigation
      initialNavigationCompleted = false;

      // Call the dashboard API which will handle navigation
      Get.find<AuthController>().GetDashboard(userType);
    } else {
      // Handle case where status is not 200 but the status code is 200
      showCustomSnackBar(
        response.body['message'] ?? 'Login failed',
        getXSnackBar: false,
        isError: true,
      );
    }
    isLoading1 = false;
    update();
  }

  ProfileResponse? profileResponse = ProfileResponse();
  Future<void> getProfile() async {
    isLoading = true;
    update();
    Response response = await Repo.Profile();
    print("Response=>${response.body}");

    if (response.body["status"] == '200') {
      try {
        profileResponse = ProfileResponse.fromJson(
          response.body,
        ); // Ensure correct parsing
        update(); // Update UI after processing
      } catch (e) {
        print("Error parsing response: $e");
        // Handle the error appropriately
      }
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else {
      // Handle error cases appropriately
    }

    isLoading = false;
    update(); // Final update call
  }

  Dashboard? Dashboardresponse = Dashboard();
  Future<void> GetDashboard(String type) async {
    isLoading2 = true;
    update();
    Response response = await Repo.Dashboards(type: type!);
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      Dashboardresponse = Dashboard.fromJson(
        response.body,
      ); // Ensure correct parsing

      // Only navigate if this is the first time calling GetDashboard after login
      if (!initialNavigationCompleted) {
        initialNavigationCompleted = true;
        // Determine dashboard based on user role and type
        String userRole = Repo.getUserRole().toLowerCase();
        String userType = Repo.getUserType().toLowerCase();

        if (userRole == "hr" && userType == "manager") {
          // Navigate to HR dashboard
          Get.offAll(() => HomePageHr());

        }else if (userRole == "hr" && userType == "user") {
          // Sales User dashboard
          Get.offAll(() => HomePageHrUser());

        }else if (userRole == "sales" && userType == "user") {
          // Sales User dashboard
          Get.offAll(() => Mainhome());

        }else if (userRole == "sales" && userType == "manager") {
          // Sales User dashboard
          Get.offAll(() => Mainhome());
        }else if (userRole == "developer" && userType == "manager") { // user
          // Sales User dashboard
          Get.offAll(() => HomePageDevloperManager());

        }else if (userRole == "developer" && userType == "user") {
          // Sales User dashboard
          Get.offAll(() => HomePageDevloperManager());

        } else {
          // Navigate to normal dashboard
          Get.offAll(() => HomePageDevloperManager());
        }
      }
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else {
      // Handle case where status is not 200 but the status code is 200
      /* showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading2 = false;
    update();
  }

  AddClientResponse? addClientResponse = AddClientResponse();
  AddUserResponse? addUserResponse = AddUserResponse();
  AllHrUserResponse? allHrUserResponse = AllHrUserResponse();

  Future<void> GetAllHrUser({
    required String fname,
    required String mobile,
    required String email,
    required String keyword,
    required String limit,
    required String offset,
    required String status,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      isLoading4 = true;
      update();
    }

    print(
      'Controller: Calling GetAllHrUser API with fname: $fname, email: $email, mobile: $mobile, keyword: $keyword',
    );

    try {
      Response response = await Repo.AllHrUser(
        fname: fname,
        mobile: mobile,
        email: email,
        keyword: keyword,
        limit: limit,
        offset: offset,
        status: status,
      );

      print(
        'Controller: GetAllHrUser API response received - Status: ${response.statusCode}, Body: ${response.body}',
      );

      if (response.body["status"] == '200') {
        allHrUserResponse = AllHrUserResponse.fromJson(response.body);
        print(
          'Successfully loaded ${allHrUserResponse?.totalCount ?? 0} HR users',
        );
      } else if (response.body["message"] == "Invalid Token") {
        Get.to(
          LoginPage(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 100),
        );
        showCustomSnackBar(
          response.body["message"],
          getXSnackBar: false,
          isError: true,
        );
      } else {
        // Handle error case
        String errorMessage =
            response.body["message"] ?? "Failed to load HR users";
        showCustomSnackBar(errorMessage, getXSnackBar: false, isError: true);
      }
    } catch (e) {
      print('Error in GetAllHrUser: $e');
      showCustomSnackBar(
        'Network error occurred',
        getXSnackBar: false,
        isError: true,
      );
    }

    if (showLoading) {
      isLoading4 = false;
    }
    update();
  }

  Future<bool> UpdateHrUserStatus({
    required String user_id,
    required String status,
  }) async {
    // 1. Optimistic Update: Update local state immediately
    if (allHrUserResponse?.data != null) {
      for (var user in allHrUserResponse!.data!) {
        if (user.id.toString() == user_id) {
          user.status = status;
          break;
        }
      }
      update(); // Rebuild UI immediately
    }

    try {
      Response response = await Repo.UpdateHrUserStatus(
        user_id: user_id,
        status: status,
      );
      if (response.body["status"] == '200') {
        // Refresh list silently
        await GetAllHrUser(
          fname: '',
          mobile: '',
          email: '',
          keyword: '',
          limit: '100',
          offset: '0',
          status: '',
          showLoading: false,
        );
        return true;
      } else {
        // Revert status if failed (optional but recommended)
        // For now, showing error
        showCustomSnackBar(
          response.body["message"] ?? "Failed to update status",
          getXSnackBar: false,
          isError: true,
        );
        return false;
      }
    } catch (e) {
      print(e);
      showCustomSnackBar(
        "Error updating status",
        getXSnackBar: false,
        isError: true,
      );
      return false;
    }
    // No need to call update() here as GetAllHrUser calls it,
    // and we already called it for optimistic update.
  }

  Future<bool> DeleteHrUser({required String user_id}) async {
    // 1. Optimistic Update: Remove from local list immediately
    if (allHrUserResponse?.data != null) {
      allHrUserResponse!.data!.removeWhere(
        (user) => user.id.toString() == user_id,
      );
      update(); // Rebuild UI immediately
    }

    try {
      Response response = await Repo.DeleteHrUser(user_id: user_id);
      if (response.body["status"] == '200') {
        // Refresh list silently
        await GetAllHrUser(
          fname: '',
          mobile: '',
          email: '',
          keyword: '',
          limit: '100',
          offset: '0',
          status: '',
          showLoading: false,
        );
        return true;
      } else {
        showCustomSnackBar(
          response.body["message"] ?? "Failed to delete user",
          getXSnackBar: false,
          isError: true,
        );
        // Optionally reload list if delete failed to restore item
        await GetAllHrUser(
          fname: '',
          mobile: '',
          email: '',
          keyword: '',
          limit: '100',
          offset: '0',
          status: '',
          showLoading: false,
        );
        return false;
      }
    } catch (e) {
      print(e);
      showCustomSnackBar(
        "Error deleting user",
        getXSnackBar: false,
        isError: true,
      );
      return false;
    }
  }

  Future<void> GetAddUser({
    required String fname,
    required String email,
    required String mobile,
    required String password,
  }) async {
    isLoading3 = true;
    update();

    print(
      'Controller: Calling AddUser API with fname: $fname, email: $email, mobile: $mobile',
    );

    Response response = await Repo.AddUser(
      fname: fname,
      email: email,
      mobile: mobile,
      password: password,
    );

    print(
      'Controller: AddUser API response received - Status: ${response.statusCode}, Body: ${response.body}',
    );

    if (response.body["status"] == '200') {
      addUserResponse = AddUserResponse.fromJson(response.body);
      showCustomSnackBar(
        response.body["message"] ?? "User added successfully",
        getXSnackBar: false,
        isError: false,
      );
      Get.back(); // Navigate back after successful addition
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else {
      // Handle error case
      String errorMessage = response.body["message"] ?? "Failed to add user";
      showCustomSnackBar(errorMessage, getXSnackBar: false, isError: true);
    }

    isLoading3 = false;
    update();
  }

  Future<void> GetAddClient({
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
    isLoading3 = true;
    update();
    Response response = await Repo.AddClient(
      name: name!,
      email: email!,
      new_email: new_email!,
      mobile: mobile!,
      new_mobile: new_mobile!,
      location: location!,
      source: source!,
      skype: skype!,
      comment: comment!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      addClientResponse = AddClientResponse.fromJson(response.body);
      Get.to(Mainhome()); // Ensure correct parsing

      showCustomSnackBar(
        response.body["Client add successfully"],
        getXSnackBar: false,
        isError: false,
      );
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else {
      // Handle case where status is not 200 but the status code is 200
      /* showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading3 = false;
    update();
  }

  //WarmResponse? warmResponse = WarmResponse();
  AllClientResponse? allClientResponse = AllClientResponse();
  Future<void> GetAllClient({
    required String name,
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
  }) async {
    isLoading4 = true;
    allClientResponse?.data?.clear(); // if `data` is already initialized
    allClientResponse = AllClientResponse(); // or reinitialize

    update();

    Response response = await Repo.AllClient(
      fname: fname,
      mobile: mobile,
      email: email,
      from_date: from_date,
      to_date: to_date,
      last_date: last_date,
      search: search,
      status: status,
      location: location,
      source: source,
      limit: limit,
      offset: offset,
      agent_id: agent_id,
    );

    print('response.body => ${response.body}');

    if (response.body["status"].toString() == "200") {
      allClientResponse = AllClientResponse.fromJson(response.body);
      //showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      allClientResponse = AllClientResponse.fromJson(response.body);
    }

    isLoading4 = false;
    update();
  }

  UpdateClientResponse? updateClientResponse = UpdateClientResponse();
  Future<void> GetUpdateClient({
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
    isLoading5 = true;
    update();
    Response response = await Repo.UpdateClient(
      client_id: client_id!,
      name: name!,
      email: email!,
      new_email: new_email!,
      mobile: mobile!,
      new_mobile: new_mobile!,
      location: location!,
      source: source!,
      skype: skype!,
      comment: source!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      updateClientResponse = UpdateClientResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      showCustomSnackBar(
        response.body["Update client add successfully"],
        getXSnackBar: false,
        isError: false,
      );
      Get.back();
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*  showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading5 = false;
    update();
  }

  ChangeStatusResponse? changeStatusResponse = ChangeStatusResponse();
  Future<void> GetChangeStatus({
    required String client_id,
    required String status,
  }) async {
    isLoading6 = true;
    update();
    Response response = await Repo.ChangeStatus(
      client_id: client_id!,
      status: status!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      changeStatusResponse = ChangeStatusResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
      showCustomSnackBar(
        response.body["Status update successfully"],
        getXSnackBar: false,
        isError: false,
      );
      //Repo.saveUserToken(response.body["data"]["token"]);
      //await allClientResponse;
      update();
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*  showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading6 = false;
    update();
  }

  AllCommentResponse? allCommentResponse = AllCommentResponse();
  Future<void> GetAllcomments({required String client_id}) async {
    isLoading7 = true;
    allCommentResponse = null;
    update();
    Response response = await Repo.Allcomments(client_id: client_id!);
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      allCommentResponse = AllCommentResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
      //showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      allCommentResponse = AllCommentResponse.fromJson(response.body);
    } else {
      /*showCustomSnackBar(response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading7 = false;
    update();
  }

  ClientDetailsResponse? clientDetailsResponse = ClientDetailsResponse();
  Future<void> GetClientDetails({required String client_id}) async {
    isLoading8 = true;
    update();
    Response response = await Repo.ClientDetails(client_id: client_id!);
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      clientDetailsResponse = ClientDetailsResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      //showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      clientDetailsResponse = ClientDetailsResponse.fromJson(response.body);
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*  showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading8 = false;
    update();
  }

  ReminderResponse? reminderResponse = ReminderResponse();
  Future<void> GetSetReminder({
    required String client_id,
    required String reminder_date,
  }) async {
    isLoading9 = true;
    update();
    Response response = await Repo.SetReminder(
      client_id: client_id!,
      reminder_date: reminder_date!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      reminderResponse = ReminderResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      showCustomSnackBar(
        response.body["Reminder add successfully"],
        getXSnackBar: false,
        isError: false,
      );
      //Get.back();
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading9 = false;
    update();
  }

  WhatappsResponse? whatappsResponse = WhatappsResponse();
  Future<void> GetAddWhatapps({
    required String client_id,
    required String whatsapp_count,
    required String calling_date,
    required String calling_time,
    required String client_mobile,
    required String client_name,
    required String calling_platform,
  }) async {
    isLoading10 = true;
    update();
    Response response = await Repo.AddWhatapps(
      client_id: client_id!,
      whatsapp_count: whatsapp_count!,
      calling_date: calling_date!,
      calling_time: calling_time!,
      client_mobile: client_mobile!,
      client_name: client_name!,
      calling_platform: calling_platform!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      whatappsResponse = WhatappsResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      /* showCustomSnackBar(
          response.body["message"], getXSnackBar: false, isError: false);*/
      //Get.back();
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else {
      // Handle case where status is not 200 but the status code is 200
      /* showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading10 = false;
    update();
  }

  CallResponse? callResponse = CallResponse();
  Future<void> GetAddCall({
    required String client_id,
    required String calling_count,
    required String calling_date,
    required String calling_time,
    required String client_mobile,
    required String client_name,
    required String calling_platform,
    required String calling_type,
    required String call_duration_in_second,
  }) async {
    isLoading11 = true;
    update();
    Response response = await Repo.AddCall(
      client_id: client_id!,
      calling_count: calling_count!,
      calling_date: calling_date!,
      calling_time: calling_time!,
      client_mobile: client_mobile!,
      client_name: client_name!,
      calling_platform: calling_platform!,
      calling_type: calling_type!,
      call_duration_in_second: call_duration_in_second!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      callResponse = CallResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      // showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading11 = false;
    update();
  }

  Future<void> updateStatusAndRefreshClient({
    required String clientId,
    required String newStatus,
  }) async {
    await GetChangeStatus(client_id: clientId, status: newStatus);
    await GetAllClient(
      name: '',
      fname: '',
      mobile: '',
      email: '',
      from_date: '',
      to_date: '',
      last_date: '',
      search: '',
      status: '',
      location: '',
      source: '',
      limit: '10000',
      offset: '0',
      agent_id: '',
    );
  }

  MultipleCallResponse? multipleCallResponse = MultipleCallResponse();
  Future<void> getCallMultiPle({
    required List<Map<String, dynamic>> multiplecallData,
  }) async {
    isLoading12 = true;
    update();

    try {
      Response response = await Repo.CallMultiPle(
        multiplecallData: multiplecallData,
      );

      if (response.body["status"] == '200') {
        print(response.body["message"]);
        //showCustomSnackBar(response.body["message"], isError: false);
        multipleCallResponse = MultipleCallResponse.fromJson(response.body);
        update();
      } else if (response.body["message"] == "Invalid Token") {
        Get.to(
          LoginPage(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 100),
        );
      } else {
        update();
        //  showCustomSnackBar(response.body['message'] ?? 'Failed', isError: true);
      }
    } catch (e) {
      //  showCustomSnackBar('An error occurred: $e', isError: false);
    } finally {
      isLoading12 = false;
      update();
    }
  }

  AllUserResponse? allUserResponse = AllUserResponse();
  Future<void> GetAllUser({
    required String name,
    required String mobile,
    required String email,
    required String status,
    required String limit,
    required String offset,
  }) async {
    isLoading13 = true;
    update();
    Response response = await Repo.AllUser(
      name: name!,
      mobile: mobile!,
      email: email!,
      status: status!,
      limit: limit!,
      offset: offset!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"].toString() == "200") {
      allUserResponse = AllUserResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      //showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      allUserResponse = AllUserResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
    } else {
      // Handle case where status is not 200 but the status code is 200
      //  showCustomSnackBar(response.body['message'], getXSnackBar: false, isError: true);
    }
    isLoading13 = false;
    update();
  }

  AddCommentResponse? addCommentResponse = AddCommentResponse();
  Future<void> GetAddComment({
    required String client_id,
    required String comment,
  }) async {
    isLoading14 = true;
    update();
    Response response = await Repo.AddComment(
      client_id: client_id!,
      comment: comment!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      addCommentResponse = AddCommentResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
      showCustomSnackBar(
        response.body["Comment add successfully"],
        getXSnackBar: false,
        isError: false,
      );
      // Get.back();
    } else {
      // Handle case where status is not 200 but the status code is 200
      /* showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading14 = false;
    update();
  }

  GmailResponse? gmailResponse = GmailResponse();
  Future<void> GetAddGmails({
    required String client_id,
    required String gmail_count,
    required String calling_date,
    required String calling_time,
    required String client_mobile,
    required String client_email,
    required String client_name,
    required String calling_platform,
  }) async {
    isLoading15 = true;
    update();
    Response response = await Repo.AddGmails(
      client_id: client_id!,
      gmail_count: gmail_count!,
      calling_date: calling_date!,
      calling_time: calling_time!,
      client_mobile: client_mobile!,
      client_email: client_email!,
      client_name: client_name!,
      calling_platform: calling_platform!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      gmailResponse = GmailResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      /* showCustomSnackBar(
          response.body["message"], getXSnackBar: false, isError: false);*/
      //Get.back();
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else {
      // Handle case where status is not 200 but the status code is 200
      /* showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading15 = false;
    update();
  }

  CallHistoryResponse? callHistoryResponse = CallHistoryResponse();
  Future<void> GetCallHistory({
    required String name,
    required String mobile,
    required String email,
    required String from_date,
    required String to_date,
    required String client_id,
    required String calling_platform,
    required String calling_type,
    required String search,
  }) async {
    isLoading16 = true;
    callHistoryResponse = null; // ✅ Properly resetting it before loading
    update();

    Response response = await Repo.CallHistory(
      name: name,
      mobile: mobile,
      email: email,
      from_date: from_date,
      to_date: to_date,
      client_id: client_id,
      calling_platform: calling_platform,
      calling_type: calling_type,
      search: search,
    );

    print('response.body => ${response.body}');

    if (response.body["status"].toString() == "200") {
      callHistoryResponse = CallHistoryResponse.fromJson(response.body);
      //showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      callHistoryResponse = CallHistoryResponse.fromJson(
        response.body,
      ); // still set it to show "No Record Found"
    } else {
      // Optionally handle other status codes
    }

    isLoading16 = false;
    update();
  }

  ActivityResponse? activityResponse = ActivityResponse();
  Future<void> GetAllActivity({
    required String from_date,
    required String to_date,
    required String agent_id,
  }) async {
    isLoading17 = true;
    update();
    Response response = await Repo.AllActivity(
      from_date: from_date!,
      to_date: to_date!,
      agent_id: agent_id!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      activityResponse = ActivityResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
      Get.to(
        ViewActivity(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );

      // showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      activityResponse = ActivityResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading17 = false;
    update();
  }

  FlowupResponse? flowupResponse = FlowupResponse();
  Future<void> GetFlowupClient({
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
  }) async {
    isLoading18 = true;
    update();
    Response response = await Repo.FlowupClient(
      name: name!,
      mobile: mobile!,
      email: email!,
      from_date: from_date!,
      to_date: to_date!,
      last_date: last_date!,
      search: search!,
      status: status!,
      location: location!,
      source: source!,
      limit: limit!,
      offset: offset!,
      agent_id: agent_id!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"].toString() == "200") {
      flowupResponse = FlowupResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      // showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      flowupResponse = FlowupResponse.fromJson(
        response.body,
      ); // still set it to show "No Record Found"
    } else {
      // Handle case where status is not 200 but the status code is 200
      //showCustomSnackBar(response.body['message'] ?? 'Login failed', getXSnackBar: false, isError: true);
    }
    isLoading18 = false;
    update();
  }

  ActivityDetailsResponse? activityDetailsResponse = ActivityDetailsResponse();
  Future<void> GetDetailsActivity({
    required String from_date,
    required String to_date,
    required String agent_id,
    required String calling_type,
  }) async {
    isLoading19 = true;
    update();
    Response response = await Repo.DetailsActivity(
      from_date: from_date!,
      to_date: to_date!,
      agent_id: agent_id!,
      calling_type: calling_type!,
    );
    print('response.body=>${response.body}');

    if (response.body["status"] == '200') {
      activityDetailsResponse = ActivityDetailsResponse.fromJson(
        response.body,
      ); // Ensure correct parsing

      // showCustomSnackBar(response.body["message"], getXSnackBar: false, isError: false);
      //Repo.saveUserToken(response.body["data"]["token"]);
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else if (response.body["status"].toString() == "404") {
      activityDetailsResponse = ActivityDetailsResponse.fromJson(
        response.body,
      ); // Ensure correct parsing
    } else {
      // Handle case where status is not 200 but the status code is 200
      /*showCustomSnackBar(
          response.body['message'] ?? 'Login failed', getXSnackBar: false,
          isError: true);*/
    }
    isLoading19 = false;
    update();
  }

  bool isLoggedIn() {
    return Repo.isLoggedIn();
  }

  bool clearSharedData() {
    return Repo.clearSharedData();
  }

  Future<Response> getAllChatUsers(int userId) async {
    print('API Request: Fetching all chat users for userId: $userId');
    Response response = await Repo.getAllChatUsers(userId);
    print(
      'API Response: getAllChatUsers - Status: ${response.statusCode}, Body: ${response.body}',
    );
    return response;
  }

  Future<Response> getChatHistory({required int user2, required int id}) async {
    print('API Request: Fetching chat history for user2: $user2, id: $id');
    Response response = await Repo.getChatHistory(user2: user2, id: id);
    print(
      'API Response: getChatHistory - Status: ${response.statusCode}, Body: ${response.body}',
    );
    return response;
  }

  void updateIndex(DashController dashController, int index) {
    dashController.updateIndex(index);

    update();
  }

  Future<Response> uploadChatImage(String imagePath) async {
    print('Calling API to upload image: $imagePath');
    Response response = await Repo.uploadChatImage(imagePath);
    print('Upload image response: ${response.body}');
    return response;
  }

  Future<Response> uploadResume(String filePath) async {
    print('Calling API to upload resume: $filePath');
    Response response = await Repo.uploadResume(filePath);
    print('Upload resume response: ${response.body}');
    return response;
  }

  Future<Response> addCandidate({
    required String name,
    required String email,
    required String number,
    required String countryCode,
    required String countryName,
    required String position,
    required String resume,
    required String interviewDate,
    required String currentCtc,
    required String expectedCtc,
    required String exp,
    required String remark,
    required String status,
  }) async {
    print('Controller: Calling addCandidate API with data:');
    print('  Name: $name');
    print('  Email: $email');
    print('  Number: $number');
    print('  Country Code: $countryCode');
    print('  Country Name: $countryName');
    print('  Position: $position');
    print('  Resume: $resume');
    print('  Interview Date: $interviewDate');
    print('  Current CTC: $currentCtc');
    print('  Expected CTC: $expectedCtc');
    print('  Experience: $exp');
    print('  Remark: $remark');
    print('  Status: $status');

    Response response = await Repo.addCandidate(
      name: name,
      email: email,
      number: number,
      countryCode: countryCode,
      countryName: countryName,
      position: position,
      resume: resume,
      interviewDate: interviewDate,
      currentCtc: currentCtc,
      expectedCtc: expectedCtc,
      exp: exp,
      remark: remark,
      status: status,
    );

    print(
      'Controller: addCandidate API response - Status: ${response.statusCode}, Body: ${response.body}',
    );
    return response;
  }

  Future<Response> getCandidateList() async {
    print('Controller: Calling getCandidateList API');

    Response response = await Repo.getCandidateList();

    print(
      'Controller: getCandidateList API response - Status: ${response.statusCode}',
    );
    print('Controller: Response Body: ${response.body}');

    update();
    return response;
  }

  NotificationResponse? notificationResponse = NotificationResponse();
  NotificationCounterResponse? notificationCounterResponse =
      NotificationCounterResponse();
  Future<void> getNotifications() async {
    Response response = await Repo.getAllNotifications();
    print('Notification API Response: ${response.body}');

    if (response.body["status"] == '200') {
      notificationResponse = NotificationResponse.fromJson(response.body);
      update();
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else {
      // Handle other error cases
      print('Error getting notifications: ${response.body}');
    }
  }

  Future<void> getNotificationCount() async {
    Response response = await Repo.getNotificationCount();
    print('Notification Count API Response: ${response.body}');

    if (response.body["status"] == '200') {
      notificationCounterResponse = NotificationCounterResponse.fromJson(
        response.body,
      );
      update();
    } else if (response.body["message"] == "Invalid Token") {
      Get.to(
        LoginPage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 100),
      );
      showCustomSnackBar(
        response.body["message"],
        getXSnackBar: false,
        isError: true,
      );
    } else {
      // Handle other error cases
      print('Error getting notification count: ${response.body}');
    }
  }

  Future<void> markAllNotificationRead() async {
    try {
      Response response = await Repo.markAllNotificationRead();
      print('Mark Notification API Response: ${response.body}');

      if (response.body["status"] == '200') {
        // Refresh notification count after marking as read
        await getNotificationCount();
        update();
      } else if (response.body["message"] == "Invalid Token") {
        Get.to(
          LoginPage(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 100),
        );
        showCustomSnackBar(
          response.body["message"],
          getXSnackBar: false,
          isError: true,
        );
      } else {
        // Handle other error cases - including when API returns HTML error page
        print('Error marking notification as read: ${response.body}');
        // Note: This API endpoint appears to have backend issues and returns 500 errors
      }
    } catch (e) {
      print('Exception occurred while marking notifications as read: $e');
      // Backend API has issues, so we catch and handle gracefully
    }
  }
}
