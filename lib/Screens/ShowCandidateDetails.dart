import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../util/appColor.dart';
import '../../api/api_client.dart';

class ShowCandidateDetails extends StatefulWidget {
  final Map<String, dynamic> candidate;

  ShowCandidateDetails({super.key, required this.candidate});

  @override
  State<ShowCandidateDetails> createState() => _ShowCandidateDetailsState();
}

class _ShowCandidateDetailsState extends State<ShowCandidateDetails> {
  late String currentStatus;
  bool _statusChanged = false;
  String? _updatedStatus;

  @override
  void initState() {
    super.initState();
    currentStatus = widget.candidate['status'] ?? 'Unknown';
  }

  void updateStatus(String newStatus) {
    setState(() {
      currentStatus = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_statusChanged) {
          Navigator.of(context).pop({
            'statusUpdated': true,
            'id': widget.candidate['id'].toString(),
            'status': _updatedStatus,
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          elevation: 0,
          title: Text(
            "Candidate Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: InkWell(
            onTap: () {
              _handleBack();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderCard(),
              SizedBox(height: 20),
              _buildPersonalInfoCard(),
              SizedBox(height: 20),
              _buildProfessionalInfoCard(),
              SizedBox(height: 20),
              _buildAdditionalInfoCard(),
              SizedBox(height: 100), // Space for FAB
            ],
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  // Header Card with basic info
  Widget _buildHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.ButtonColor2,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.candidate['name'] ?? 'N/A',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _buildStatusBadge(currentStatus),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.candidate['position'] ?? 'Position not specified',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'ID: ${widget.candidate['id'] ?? 'N/A'}',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Personal Information Card
  Widget _buildPersonalInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF223e6d),
            ),
          ),
          SizedBox(height: 15),
          _buildInfoRow("Email", widget.candidate['email'] ?? 'N/A'),
          SizedBox(height: 10),
          _buildInfoRowWithCountry(
            "Phone",
            widget.candidate['number'] ?? 'N/A',
            widget.candidate['country_code'] ?? '+91',
            widget.candidate['country_name'] ?? 'India',
          ),
          SizedBox(height: 10),
          _buildInfoRow(
            "Experience",
            "${widget.candidate['exp'] ?? 'N/A'} Years",
          ),
          SizedBox(height: 10),
          _buildInfoRow(
            "Current Company",
            widget.candidate['current_company'] ?? 'N/A',
          ),
        ],
      ),
    );
  }

  // Professional Information Card
  Widget _buildProfessionalInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Professional Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF223e6d),
            ),
          ),
          SizedBox(height: 15),
          _buildInfoRow("Position", widget.candidate['position'] ?? 'N/A'),
          SizedBox(height: 10),
          _buildInfoRow("Source", widget.candidate['source'] ?? 'N/A'),
          SizedBox(height: 10),
          _buildInfoRow(
            "Interview Date",
            widget.candidate['interview_date'] ?? 'Not scheduled',
          ),
          SizedBox(height: 10),
          _buildInfoRow("Location", widget.candidate['location'] ?? 'N/A'),
        ],
      ),
    );
  }

  // Additional Information Card
  Widget _buildAdditionalInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Additional Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF223e6d),
            ),
          ),
          SizedBox(height: 15),
          _buildInfoRow(
            "Current CTC",
            widget.candidate['current_ctc'] ?? 'N/A',
          ),
          SizedBox(height: 10),
          _buildInfoRow(
            "Expected CTC",
            widget.candidate['expected_ctc'] ?? 'N/A',
          ),
          SizedBox(height: 10),
          _buildresume("Resume", widget.candidate['resume'] ?? 'Not uploaded'),
          SizedBox(height: 10),
          _buildRemarkSection(),
          SizedBox(height: 10),
          _buildInfoRow("Created Date", widget.candidate['created'] ?? 'N/A'),
        ],
      ),
    );
  }

  /// resume url open

  Widget _buildresume(String label, String value) {
    bool isLink = value.startsWith("http");

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: isLink
                ? InkWell(
              onTap: () async {
                final Uri uri = Uri.parse(value);

                try {
                  await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  );
                } catch (e) {
                  Get.snackbar(
                    "Error",
                    "No application found to open this file",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
                : Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for info rows
  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            "$label:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  // Helper widget for phone with country info
  Widget _buildInfoRowWithCountry(
    String label,
    String number,
    String code,
    String country,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            "$label:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$code $number",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Text(country, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  // Remark section with better formatting
  Widget _buildRemarkSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            "Remark:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.candidate['remark'] ?? 'No remarks',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  // Status badge widget
  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor = Colors.white;

    switch (status.toLowerCase()) {
      case 'interviewed':
        backgroundColor = Colors.orange;
        break;
      case 'shortlisted':
        backgroundColor = Colors.blue;
        break;
      case 'selected':
        backgroundColor = Colors.green;
        break;
      case 'rejected':
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Floating Action Button with status dropdown and delete
  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      backgroundColor: AppColor.ButtonColor2,
      onPressed: () {
        // Handle FAB tap - show options
        _showActionOptions();
      },
      icon: Icon(Icons.edit, color: Colors.white),
      label: Text(
        'Actions',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Show action options dialog
  void _showActionOptions() {
    showModalBottomSheet(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Action',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF223e6d),
                ),
              ),
              SizedBox(height: 20),
              // Status Update Option
              ListTile(
                leading: Icon(Icons.update, color: Colors.blue),
                title: Text('Update Status'),
                onTap: () {
                  Navigator.pop(context);
                  _showStatusUpdateDialog();
                },
              ),
              Divider(),
              // Delete Option
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete Candidate'),
                onTap: () {
                  Get.back(); // Close bottom sheet / popup
                  _showDeleteConfirmationDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Show status update dialog
  void _showStatusUpdateDialog() {
    final List<String> statuses = [
      'Shortlisted',
      'Interviewed',
      'Selected',
      'Rejected',
    ];

    String selectedStatus = widget.candidate['status'] ?? 'Shortlisted';

    showModalBottomSheet(
      context: Get.overlayContext!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update Candidate Status',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF223e6d),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Select new status:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedStatus,
                      items:
                          statuses.map((String status) {
                            return DropdownMenuItem<String>(
                              value: status,
                              child: Text(status),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        }
                      },
                      underline: SizedBox(),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          // Show loading
                          Get.dialog(
                            Center(child: CircularProgressIndicator()),
                            barrierDismissible: false,
                          );

                          try {
                            final apiClient = Get.find<ApiClient>();
                            final response = await apiClient
                                .updateCandidateStatus(
                                  widget.candidate['id'].toString(),
                                  selectedStatus,
                                );

                            Get.back(); // Close loading dialog

                            if (response.statusCode == 200) {
                              // Update the UI immediately
                              updateStatus(selectedStatus);
                              _statusChanged = true;
                              _updatedStatus = selectedStatus;

                              Get.snackbar(
                                'Success',
                                'Candidate status updated to $selectedStatus',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                              // Optionally refresh the candidate data or navigate back
                            } else {
                              Get.snackbar(
                                'Error',
                                response.statusText ??
                                    'Failed to update status',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          } catch (e) {
                            Get.back(); // Close loading dialog
                            Get.snackbar(
                              'Error',
                              'Failed to update candidate status',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.ButtonColor2,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Update'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Show delete confirmation dialog
  void _showDeleteConfirmationDialog() {
    Get.defaultDialog(
      title: 'Delete Candidate',
      content: Text(
        'Are you sure you want to delete this candidate? This action cannot be undone.',
        textAlign: TextAlign.center,
      ),
      confirm: ElevatedButton(
        onPressed: () async {
          Get.back(); // Close confirmation dialog
          // Show loading
          Get.dialog(
            Center(child: CircularProgressIndicator()),
            barrierDismissible: false,
          );

          try {
            final apiClient = Get.find<ApiClient>();
            final response = await apiClient.deleteCandidate(
              widget.candidate['id'].toString(),
            );

            Get.back(); // Close loading dialog

            if (response.statusCode == 200) {
              Get.snackbar(
                'Success',
                'Candidate has been deleted successfully',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
              // Navigate back to previous screen after successful deletion
              Future.delayed(Duration(seconds: 1), () {
                // Use Navigator.pop to ensure we close the screen, not the snackbar
                if (mounted) {
                  Navigator.of(context).pop(true);
                }
              });
            } else {
              Get.snackbar(
                'Error',
                response.statusText ?? 'Failed to delete candidate',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          } catch (e) {
            Get.back(); // Close loading dialog
            Get.snackbar(
              'Error',
              'Failed to delete candidate',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        child: Text('Delete'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
        ),
        child: Text('Cancel'),
      ),
    );
  }

  void _handleBack() {
    if (_statusChanged) {
      Navigator.of(context).pop({
        'statusUpdated': true,
        'id': widget.candidate['id'].toString(),
        'status': _updatedStatus,
      });
    } else {
      Get.back();
    }
  }
}
