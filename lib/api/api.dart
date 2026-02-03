class ApiUrls {
  static String BASE_URL = "https://crm.technoderivation.com/api/App/";
  // static String BASE_URL = "https://crm.technoderivation.com/test-api/App/"; ///// this is a local base url
  static String BASE_URL2 =
      "https://nodecrm.technoderivation.com:3002/"; //// this is a chat base url

  /// End point url
  static const String Signin = "agent/auth/login";
  static const String dashboard = "agent/user/dashboard";
  static const String dashboardHr = "agent/user/hr_dashboard";

  /// hr role api
  static const String addUser = "agent/user/add_hr_user";
  static const String allUser = "agent/user/all_hr_user_list";
  static const String uploadResume = "agent/upload/upload_resume";
  static const String addCandidate = "agent/candidate/add_candidate";
  static const String showCandidate = "agent/candidate/all_candidate";
  static const String updateCandidate = "agent/candidate/update_candidate_status";
  static const String deleteCandidate = "agent/candidate/delete_candidate";
  static const String updateUser = "agent/user/update_hr_user_status";
  static const String deleteUser = "agent/user/delete_hr_user";

  static const String Addclient = "agent/client/add_client";
  static const String ProfileData = "agent/user/profile_details";
  static const String Allclient = "agent/client/all_client";
  static const String flowupClient = "agent/client/all_followup_client";
  static const String Updateclient = "agent/client/update_client";
  static const String Changestatus = "agent/client/change_status";
  static const String Clientdetails = "agent/client/client_details";
  static const String Allcomments = "agent/client/view_all_comments";
  static const String Setreminder = "agent/client/update_reminder";
  static const String Whatapps = "agent/client/add_whatsapp_history";
  static const String Call = "agent/client/add_calling_history";
  static const String MultipleCall =
      "agent/client/add_calling_multiple_history";
  static const String AllUserList = "agent/user/all_User_list";
  static const String Allcomment = "agent/client/add_comment";
  static const String Addgmails = "agent/client/add_gmail_history";
  static const String Callhistory = "agent/client/client_all_call_history";
  static const String Allactivity = "agent/user/user_all_activity";
  static const String AllDetailsactivity = "agent/user/user_activity_details";

  /// show all the notification
  static const String AllNotification = "agent/user/allNotificationList";
  static const String AllNotificationCounter =
      "agent/user/getNotificationCount";
  static const String MarkNotification = "agent/user/notificationMarkAllRead";

  /// this is a chat dashboard
  static final String ChatAlluser = "${BASE_URL2}user/allusers";

  /// this is correct base url
  static final String ChatHistory = "${BASE_URL2}messages/getAllMessages";

  /// this is correct base url
  static final String chatImageUpload = "agent/upload/image_upload";

  /// this is a chat image upload
  static final String markRead = "${BASE_URL2}user/mark-read";

  /// this is ia chat image upload
}
