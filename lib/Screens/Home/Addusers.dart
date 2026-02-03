import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';

class AddUsers extends StatefulWidget {
   AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  // Updated Controllers
  final TextEditingController fname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _isPasswordVisible = false;
  
  // AuthController instance
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF223e6d),
        elevation: 0,
        title:  Text(
          "Add User",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child:  Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: AppColor.Background),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel("Full Name"),
                  _buildTextField(fname, "Enter Full Name", TextInputType.name),

                   SizedBox(height: 15),
                  _buildLabel("Email Address"),
                  _buildTextField(email, "Enter Email", TextInputType.emailAddress),

                   SizedBox(height: 15),
                  _buildLabel("Mobile Number"),
                  _buildTextField(mobile, "Enter Mobile Number", TextInputType.phone),

                   SizedBox(height: 15),
                  _buildLabel("Password"),
                  _buildPasswordField(),

                   SizedBox(height: 40),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build labels
  Widget _buildLabel(String label) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 5),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: AppColor.Black,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  // Generic text field builder
  Widget _buildTextField(TextEditingController controller, String hint, TextInputType type) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.White,
      ),
      child: TextField(
        controller: controller,
        keyboardType: type,
        style:  TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Poppins"),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14, color: AppColor.AuthhintColor),
          contentPadding:  EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  // Specific password field with visibility toggle
  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.White,
      ),
      child: TextField(
        controller: password,
        obscureText: !_isPasswordVisible,
        style:  TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Poppins"),
        decoration: InputDecoration(
          hintText: "Enter Password",
          hintStyle: TextStyle(fontSize: 14, color: AppColor.AuthhintColor),
          contentPadding:  EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.ButtonColor2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          if (fname.text.isEmpty || email.text.isEmpty || mobile.text.isEmpty || password.text.isEmpty) {
            Get.snackbar("Error", "All fields are required",
                snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
          } else {
            // Call the API to add user
            print("📱 Submit button pressed - Calling AddUser API");
            print("📝 Form data:");
            print("   Full Name: ${fname.text}");
            print("   Email: ${email.text}");
            print("   Mobile: ${mobile.text}");
            print("   Password: ${password.text}");
            
            authController.GetAddUser(
              fname: fname.text,
              email: email.text,
              mobile: mobile.text,
              password: password.text,
            );
          }
        },
        child:  Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
        ),
      ),
    );
  }
}