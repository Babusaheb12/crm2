import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';

class AddCandidate extends StatefulWidget {
   AddCandidate({super.key});
  @override
  State<AddCandidate> createState() => _AddCandidateState();
}
class _AddCandidateState extends State<AddCandidate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController fname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController interviewDate = TextEditingController();
  final TextEditingController currentCtc = TextEditingController();
  final TextEditingController expectedCtc = TextEditingController();
  final TextEditingController experience = TextEditingController();
  final TextEditingController remark = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  // State Variables
  String countryCode = "+91";
  String countryName = "India";
  String selectedPosition = "Business Analyst";
  String selectedStatus = "Shortlisted";
  String? resumePath;
  String? uploadedResumeUrl;
  bool isUploadingResume = false;
  String? resumeFileName;

  final List<String> positions = [
    "Business Analyst",
    "Business Development Executive",
    "SEO Executive",
    "UX-UI Designer",
    "Tester",
    "Digital Marketing",
    "Frontend Developer",
    "Backend Developer",
    "Flutter Developer",
    "Android Developer",
    "Full-Stack Developer",
    "PHP/Laravel Developer",
  ];


  final List<String> statuses = [
    "Shortlisted",
    "Interviewed",
    "Selected",
    "Rejected",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Background,
      appBar: AppBar(
        backgroundColor:  Color(0xFF223e6d),
        elevation: 0,
        title:  Text("Add Candidate", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:  Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label("Full Name"),
              _textField(fname, "Enter Full Name", validator: (value) {
                if (value == null || value.trim().isEmpty) return 'Please enter full name';
                if (value.trim().length < 3) return 'Name is too short';
                return null;
              }),

              _gap(),
              _label("Email Address"),
              _textField(email, "Enter Email", type: TextInputType.emailAddress, validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter email';
                if (!GetUtils.isEmail(value)) return 'Enter a valid email address';
                return null;
              }),

              _gap(),
              _label("Mobile Number"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align for validation errors
                children: [
                  _countryPicker(),
                   SizedBox(width: 10),
                  Expanded(
                    child: _textField(
                      mobile,
                      "Enter Mobile Number",
                      type: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        if (!RegExp(r'^[0-9]{7,15}$').hasMatch(value)) return 'Invalid number';
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              _gap(),
              _label("Position"),
              _validationDropdown(positions, selectedPosition, (val) {
                setState(() => selectedPosition = val);
              }),

              _gap(),
              _label("Resume"),
              _resumePicker(),

              _gap(),
              _label("Interview Date"),
              _datePickerField(),

              _gap(),
              _label("Current CTC"),
              _textField(currentCtc, "e.g. 15 K or 5.5 L", validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter current CTC';
                return null;
              }),

              _gap(),
              _label("Expected CTC"),
              _textField(expectedCtc, "e.g. 20 K or 8 L", validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter expected CTC';
                return null;
              }),

              _gap(),
              _label("Experience"),
              _textField(experience, "e.g. 2 Years", validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter experience';
                return null;
              }),

              _gap(),
              _label("Remark"),
              _textField(remark, "Enter Remark", maxLines: 3, validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter remark';
                return null;
              }),

              _gap(),
              _label("Status"),
              _validationDropdown(statuses, selectedStatus, (val) {
                setState(() => selectedStatus = val);
              }),

               SizedBox(height: 40),
              _submitButton(),
               SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- UI Helpers ----------

  Widget _label(String text) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8),
      child: Text(text, style:  TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    );
  }

  Widget _gap() =>  SizedBox(height: 15);

  Widget _textField(TextEditingController controller, String hint,
      {TextInputType type = TextInputType.text, String? Function(String?)? validator, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      maxLines: maxLines,
      style:  TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        fillColor: AppColor.White,
        filled: true,
        hintStyle:  TextStyle(color: Colors.grey, fontSize: 13),
        contentPadding:  EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide:  BorderSide(color: Color(0xFF223e6d), width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide:  BorderSide(color: Colors.red)),
      ),
      validator: validator,
    );
  }

  Widget _validationDropdown(List<String> items, String value, Function(String) onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        fillColor: AppColor.White,
        filled: true,
        contentPadding:  EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
      ),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style:  TextStyle(fontSize: 14)))).toList(),
      onChanged: (val) => onChanged(val!),
    );
  }

  Widget _resumePicker() {
    return InkWell(
      onTap: () async {
        if (isUploadingResume) return; // Prevent multiple uploads
        
        final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'doc', 'docx']);
        if (result != null) {
          final file = result.files.single;
          final filePath = file.path;
          final fileName = file.name;
          
          if (filePath != null) {
            setState(() {
              resumePath = fileName;
              resumeFileName = fileName;
              isUploadingResume = true;
            });
            
            // Automatically upload the resume
            await _uploadResume(filePath);
          }
        }
      },
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.White,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isUploadingResume ? Colors.orange : Colors.grey.shade300),
        ),
        child: Row(
          children: [
            isUploadingResume 
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)),
                )
              : Icon(Icons.upload_file, color: _getResumeIconColor()),
             SizedBox(width: 10),
            Expanded(
              child: Text(
                _getResumeDisplayText(),
                style: TextStyle(color: _getResumeTextColor(), fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper methods for resume picker UI
  Color _getResumeIconColor() {
    if (isUploadingResume) return Colors.orange;
    if (uploadedResumeUrl != null) return Colors.green;
    return Colors.grey;
  }
  
  Color _getResumeTextColor() {
    if (isUploadingResume) return Colors.orange;
    if (uploadedResumeUrl != null) return Colors.green;
    return Colors.grey;
  }
  
  String _getResumeDisplayText() {
    if (isUploadingResume) return "Uploading $resumeFileName...";
    if (uploadedResumeUrl != null) return "$uploadedResumeUrl"; // Show the full filename returned by the server
    if (resumePath != null) return resumePath!;
    return "Upload Resume (PDF/DOC)";
  }
  
  Future<void> _uploadResume(String filePath) async {
    try {
      print('Starting resume upload for file: $filePath');
      
      final response = await authController.uploadResume(filePath);
      
      if (response.statusCode == 200) {
        // Parse the response to get the uploaded file URL/path
        Map<String, dynamic> responseBody = response.body is String ? json.decode(response.body) : response.body;
        String uploadedUrl = responseBody['resume'] ?? '';
        
        setState(() {
          uploadedResumeUrl = uploadedUrl;
          isUploadingResume = false;
        });
        
        Get.snackbar(
          "Success", 
          "Resume uploaded successfully!", 
          backgroundColor: Colors.green, 
          colorText: Colors.white
        );
        
        print('Resume uploaded successfully. Filename: $uploadedResumeUrl');
      } else {
        throw Exception('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Resume upload error: $e');
      
      setState(() {
        isUploadingResume = false;
        resumePath = null;
        resumeFileName = null;
      });
      
      Get.snackbar(
        "Error", 
        "Failed to upload resume: ${e.toString()}", 
        backgroundColor: Colors.red, 
        colorText: Colors.white
      );
    }
  }

  Widget _datePickerField() {
    return InkWell(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(), // Usually interview is in future
          lastDate: DateTime(2030),
        );
        if (picked != null) {
          setState(() => interviewDate.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}");
        }
      },
      child: AbsorbPointer(
        child: _textField(interviewDate, "YYYY-MM-DD", validator: (value) {
          if (value == null || value.isEmpty) return 'Please select a date';
          return null;
        }),
      ),
    );
  }

  Widget _countryPicker() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.White,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: CountryCodePicker(
        onChanged: (e) {
          setState(() {
            countryCode = e.dialCode!;
            countryName = e.name!;
          });
        },
        initialSelection: 'IN',
        favorite: const ['+91', 'IN'],
        // These properties hide the flag and country name from the default view
        showFlag: false,
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        // Optional: Ensure the text style matches your form
        textStyle: const TextStyle(fontSize: 14, color: Colors.black),
        // This builder forces the UI to show ONLY the dial code
        builder: (code) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              code?.dialCode ?? "+91",
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          );
        },
      ),
    );
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _submit,
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF223e6d),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child:  Text("Submit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (uploadedResumeUrl == null) {
        Get.snackbar("Error", "Please upload a resume", backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      try {
        // Call the add candidate API with all form data
        Get.snackbar("Processing", "Adding candidate...", backgroundColor: Colors.blue, colorText: Colors.white);
        
        await authController.addCandidate(
          name: fname.text,
          email: email.text,
          number: mobile.text,
          countryCode: countryCode,
          countryName: countryName,
          position: selectedPosition,
          resume: uploadedResumeUrl!, // Use the uploaded resume filename
          interviewDate: interviewDate.text,
          currentCtc: currentCtc.text,
          expectedCtc: expectedCtc.text,
          exp: experience.text,
          remark: remark.text,
          status: selectedStatus,
        );
        
        Get.snackbar("Success", "Candidate Added Successfully", backgroundColor: Colors.green, colorText: Colors.white);
        
        // Reset form after successful submission
        _resetForm();
      } catch (e) {
        Get.snackbar("Error", "Failed to add candidate: ${e.toString()}", backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }
  
  void _resetForm() {
    fname.clear();
    email.clear();
    mobile.clear();
    interviewDate.clear();
    currentCtc.clear();
    expectedCtc.clear();
    experience.clear();
    remark.clear();
    
    setState(() {
      selectedPosition = positions.first;
      selectedStatus = statuses.first;
      uploadedResumeUrl = null;
      resumePath = null;
      resumeFileName = null;
    });
  }
}