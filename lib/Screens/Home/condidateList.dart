import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/appColor.dart';
import '../../Controller/AgentController/Authcontroller.dart';
import '../../Response/AgentResponse/CandidateListResponse.dart';
import '../ShowCandidateDetails.dart';

class condidateList extends StatefulWidget {
  condidateList({super.key});

  @override
  State<condidateList> createState() => _condidateListState();
}

class _condidateListState extends State<condidateList> {
  TextEditingController searchController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  // State variables
  bool isLoading = true;
  bool isLoadingMore = false;
  int currentPage = 0;
  int itemsPerPage = 20;
  CandidateListResponse? candidateResponse;
  List<CandidateData> allCandidates = [];
  List<CandidateData> displayedCandidates = [];
  List<CandidateData> filteredCandidates = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadCandidateList();
  }

  Future<void> _loadCandidateList({bool loadMore = false}) async {
    if (loadMore && isLoadingMore) return;

    setState(() {
      if (loadMore) {
        isLoadingMore = true;
      } else {
        isLoading = true;
        currentPage = 0;
        allCandidates.clear();
        displayedCandidates.clear();
      }
    });

    try {
      // Only fetch data from API on initial load
      if (!loadMore) {
        final response = await authController.getCandidateList();
        if (response.statusCode == 200) {
          final responseBody =
              response.body is String
                  ? json.decode(response.body)
                  : response.body;
          candidateResponse = CandidateListResponse.fromJson(responseBody);
          allCandidates = candidateResponse!.data;
        }
      }

      // Update current page
      if (loadMore) {
        currentPage++;
      } else {
        currentPage = 1;
      }

      // Apply pagination to displayed candidates
      _applyPagination();

      // Apply current filter
      _applyFilter();
    } catch (e) {
      print('Error loading candidate list: $e');
      Get.snackbar(
        "Error",
        "Failed to load candidates: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() {
        isLoading = false;
        isLoadingMore = false;
      });
    }
  }

  void _filterCandidates(String query) {
    setState(() {
      searchQuery = query;
    });
    _applyFilter();
  }

  void _applyPagination() {
    final startIndex = 0;
    final endIndex = currentPage * itemsPerPage;

    // Take only the items up to current page
    if (endIndex <= allCandidates.length) {
      displayedCandidates = allCandidates.sublist(0, endIndex);
    } else {
      displayedCandidates = List.from(allCandidates);
    }

    print(
      'Pagination: Page $currentPage, Displaying ${displayedCandidates.length} out of ${allCandidates.length} candidates',
    );
  }

  void _applyFilter() {
    if (searchQuery.isEmpty) {
      filteredCandidates = List.from(displayedCandidates);
    } else {
      filteredCandidates =
          displayedCandidates.where((candidate) {
            return candidate.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                candidate.email.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                candidate.number.contains(searchQuery);
          }).toList();
    }
  }

  void _updateCandidateStatusLocally(String id, String newStatus) {
    CandidateData copyWithStatus(CandidateData c) => CandidateData(
      id: c.id,
      name: c.name,
      email: c.email,
      number: c.number,
      countryCode: c.countryCode,
      countryName: c.countryName,
      position: c.position,
      exp: c.exp,
      currentCompany: c.currentCompany,
      resume: c.resume,
      location: c.location,
      source: c.source,
      interviewDate: c.interviewDate,
      currentCtc: c.currentCtc,
      expectedCtc: c.expectedCtc,
      remark: c.remark,
      status: newStatus,
      created: c.created,
    );
    void updateList(List<CandidateData> list) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].id == id) {
          list[i] = copyWithStatus(list[i]);
        }
      }
    }

    setState(() {
      updateList(allCandidates);
      updateList(displayedCandidates);
      updateList(filteredCandidates);
    });
  }

  void _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final metrics = notification.metrics;
      final maxScroll = metrics.maxScrollExtent;
      final currentScroll = metrics.pixels;

      // More sensitive scroll detection - trigger when near the end
      final triggerPoint = maxScroll * 0.7; // Trigger at 70% scroll

      print('Scroll Debug:');
      print('  Current scroll: $currentScroll');
      print('  Max scroll: $maxScroll');
      print('  Trigger point: $triggerPoint');
      print('  Displayed items: ${displayedCandidates.length}');
      print('  Total available: ${allCandidates.length}');
      print('  Loading more: $isLoadingMore');

      // Load more when user reaches near the end of currently displayed items
      if (currentScroll > triggerPoint &&
          !isLoadingMore &&
          (displayedCandidates.length < allCandidates.length)) {
        print('>>> Loading more candidates! <<<');
        _loadCandidateList(loadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        elevation: 0,
        title: Text(
          "All Candidates",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          _buildSearchBar(),
          SizedBox(height: 10),
          _buildHeaderSection(),
          SizedBox(height: 10),
          Expanded(
            child:
                isLoading
                    ? _buildLoadingIndicator()
                    : (filteredCandidates.isEmpty
                        ? _buildNoRecordFound()
                        : _buildCandidateList()),
          ),
          if (isLoadingMore)
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 12),
                    Text("Loading more candidates..."),
                  ],
                ),
              ),
            ),
          // Show "No more data" message when all items are displayed
          if (!isLoading &&
              !isLoadingMore &&
              displayedCandidates.length >= allCandidates.length &&
              allCandidates.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "No more candidates to load",
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: searchController,
        onChanged: _filterCandidates,
        decoration: InputDecoration(
          hintText: "Search candidates...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        ),
      ),
    );
  }

  // Header showing total count and filter icon
  Widget _buildHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Records: ${candidateResponse?.totalCount ?? 0}",
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: _loadCandidateList,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.ButtonColor2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.filter_list_alt, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Loading indicator
  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Loading candidates...", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // The actual ListView
  Widget _buildCandidateList() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _onScrollNotification(notification);
        return false;
      },
      child: ListView.builder(
        itemCount: filteredCandidates.length,
        itemBuilder: (context, index) {
          final candidate = filteredCandidates[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.05),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Text(
                  candidate.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(candidate.email),
                    Text("${candidate.countryCode}${candidate.number}"),
                    Text("Position: ${candidate.position}"),
                    Text("Experience: ${candidate.exp}"),
                    SizedBox(height: 4),
                    if (candidate.status != null)
                      _buildStatusBadge(candidate.status!),
                    if (candidate.currentCtc != null)
                      Text("Current CTC: ${candidate.currentCtc}"),
                    if (candidate.expectedCtc != null)
                      Text("Expected CTC: ${candidate.expectedCtc}"),
                    if (candidate.interviewDate != null)
                      Text("Interview Date: ${candidate.interviewDate}"),
                    if (candidate.remark != null)
                      Text("Remark: ${candidate.remark}"),
                  ],
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  // Navigate to the candidate details screen and pass the selected candidate
                  final result = await Get.to(
                    () => ShowCandidateDetails(
                      candidate: _candidateToMap(candidate),
                    ),
                  );

                  // If result is true, it means the candidate was deleted
                  if (result == true) {
                    setState(() {
                      // Remove the candidate from all lists to update UI locally without refresh
                      allCandidates.removeWhere((c) => c.id == candidate.id);
                      displayedCandidates.removeWhere(
                        (c) => c.id == candidate.id,
                      );
                      filteredCandidates.removeWhere(
                        (c) => c.id == candidate.id,
                      );
                    });
                  } else if (result is Map && result['statusUpdated'] == true) {
                    final String id = result['id'].toString();
                    final String newStatus = result['status'].toString();
                    _updateCandidateStatusLocally(id, newStatus);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: "$label: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  // Helper for Status badge
  Widget _buildStatusBadge(String status) {
    Color color;
    String text;

    switch (status.toLowerCase()) {
      case 'shortlisted':
        color = Colors.blue;
        text = "Shortlisted";
        break;
      case 'interviewed':
        color = Colors.orange;
        text = "Interviewed";
        break;
      case 'selected':
        color = Colors.green;
        text = "Selected";
        break;
      case 'rejected':
        color = Colors.red;
        text = "Rejected";
        break;
      default:
        color = Colors.grey;
        text = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  // UI for empty state
  Widget _buildNoRecordFound() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff686666)),
        ),
        child: Text(
          "No Record Found......",
          style: TextStyle(fontSize: 16, color: Color(0xff686666)),
        ),
      ),
    );
  }

  // Helper method to convert CandidateData to Map for ShowCandidateDetails
  Map<String, dynamic> _candidateToMap(CandidateData candidate) {
    return {
      'id': candidate.id,
      'name': candidate.name,
      'email': candidate.email,
      'number': candidate.number,
      'country_code': candidate.countryCode,
      'country_name': candidate.countryName,
      'exp': candidate.exp,
      'current_company': candidate.currentCompany,
      'position': candidate.position,
      'source': candidate.source,
      'interview_date': candidate.interviewDate,
      'location': candidate.location,
      'current_ctc': candidate.currentCtc,
      'expected_ctc': candidate.expectedCtc,
      'resume': candidate.resume,
      'remark': candidate.remark,
      'status': candidate.status,
      'created': candidate.created,
    };
  }
}
