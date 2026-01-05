import 'dart:developer';

import 'package:crm/appcomman/AppUtil.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';

class InvoiceDetail extends StatefulWidget {
  const InvoiceDetail({super.key});

  @override
  State<InvoiceDetail> createState() => _DetailState();
}

class _DetailState extends State<InvoiceDetail>  with SingleTickerProviderStateMixin{
  TextEditingController descriptionCt = TextEditingController();
  TextEditingController reminderDateCt = TextEditingController();
  TextEditingController reminderTimeCt = TextEditingController();

  List<String>sourceList = ["Pending", "Approved"];
  List<String>setReminderMember = ["Member1", "Member2","Member3","Member4","Member5","Member6"];
  String selectSource = 'Pending';
  String selectReminderMember = 'Member1';
  late Future<DateTime?> selectedDate;
  String date = "-";

  late Future<TimeOfDay?> selectedTime;
  String time = "-";
  List<String>fileNameList = [];
  FilePickerResult? result;
  var filePath = '';
  bool notesVisible = false;
  bool reminderVisible = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Adjust the length as needed
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:
            (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        actions: [
          Container(
            width: 90,
            height: 30,
            color: Colors.white,
            child: Center(
              child: PopupMenuButton<String>(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(selectSource,style: TextStyle(color:primary,fontSize: 14),),
                ),
                onSelected: (value) {
                  // Handle the selected menu item

                  setState(() {
                    selectSource = value;
                  });
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'Pending',
                      child: Text('Pending'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Approved',
                      child: Text('Approved'),
                    ),

                  ];
                },
              ),
            ),
          ),
          SizedBox(width: 15,),


        ],
        title: Text("Lead Name",style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      body:DefaultTabController(
        length: 3,
        child: NestedScrollView(

          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter( //headerSilverBuilder only accepts slivers
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 4),
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),

                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),


                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black),
                            ),

                            SizedBox(height: 4,),
                            Text(
                              "Company Name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.black),
                            ),

                            SizedBox(height: 4,),
                            Text(
                              "1234567890",
                              style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            /* SizedBox(height: 4,),
                                Text(
                                  "Sanjay Kumar",
                                  maxLines: 1,

                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                      color: Colors.black
                                  ),),
                                SizedBox(height: 4,),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "02-02-2024",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6)

                                  ),),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),

                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),


                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black),
                          ),


                          SizedBox(height: 4,),
                          Text(
                            "- 3 Edge Technologies Company",
                            style: TextStyle(

                                fontSize: 13,
                                color: Colors.black.withOpacity(0.6)),
                          ),

                        ],
                      ),
                    ),
                    TabBar(
                      tabs: [
                        Tab(child: Text('Document')),
                        Tab(child: Text('Notes')),
                        Tab(child: Text('Reminder')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              // I wrapped large widgets in the SingleChildScrollView
              imageWidget(),
              notesWidget(),
              reminderWidget(),

            ],
          ),
        ),
      ),


    );
  }

  Widget reminderWidget()
  {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: const Text(
                          'Date',
                          style: TextStyle(
                            color: Color(0xFF494949),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        height: 41,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color(0xFFC9C9C9),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          controller: reminderDateCt,
                          onTap: () async {
                            showDialogPicker(context);

                          },
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF494949),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,

                          ),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,

                            // constraints: BoxConstraints(maxHeight: height * 0.06),
                            isDense: true,
                            suffixIcon: IconButton(
                              onPressed: () async{
                                showDialogPicker(context);
                              },
                              icon: const Icon(Icons.calendar_month),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                            hintText: "Date to be notified",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: const Text(
                          'Time',
                          style: TextStyle(
                            color: Color(0xFF494949),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        height: 41,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color(0xFFC9C9C9),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          controller: reminderTimeCt,
                          onTap: () async {
                            showDialogTimePicker(context);
                          },
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF494949),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,

                          ),
                          decoration: InputDecoration(
                            // constraints: BoxConstraints(maxHeight: height * 0.06),
                            isDense: true,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                showDialogTimePicker(context);
                              },
                              icon: const Icon(Icons.calendar_month),
                            ),
                            border: InputBorder.none,
                            hintText: "Time to be notified",
                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                  child: Text("Set Reminder To", style: TextStyle(
                    color: Color(0xFF494949),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: primary,width: 1)
                  ),
                  padding:const EdgeInsets.symmetric(horizontal: 10.0),

                  child: DropdownSearch<String>(


                    popupProps: PopupProps.menu(

                      showSearchBox: true,

                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: setReminderMember,

                    dropdownDecoratorProps: DropDownDecoratorProps(

                      dropdownSearchDecoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Source",
                          contentPadding: EdgeInsets.symmetric(vertical: 11)
                      ),
                    ),
                    onChanged: print,
                    selectedItem: selectReminderMember,
                  ),





                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(

                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: CupertinoColors.activeBlue,

                        ),
                        child: Text(
                          "Submit", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget notesWidget()
  {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Notes"),
            SizedBox(height: 5,),
            TextField(
              controller: descriptionCt,
        
              maxLines: null,
              keyboardType: TextInputType.multiline,
              minLines: 4,
              // focusNode: memberNameNode,
              decoration: InputDecoration(
        
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary,),
                      borderRadius: BorderRadius.circular(6)
                  ),
        
        
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  hintText: "Add Note",
                  hintStyle: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.grey,
                      fontSize: 14)),
            ),
            SizedBox(height: 10,),
        
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
        
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: CupertinoColors.activeBlue,
        
                    ),
                    child: Text(
                      "Submit", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
        
                  children: [
                    CircleAvatar(
                        backgroundColor: primary,
                        child: Icon(Icons.person,color: Colors.white,)),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sanjay Kumar", style: TextStyle(
                              fontWeight: FontWeight.bold),),
                          // Text("Note Added: 02-01-2024  11:55 AM"),
                          SizedBox(height: 5,),
                          Text("Next Note "),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("11:55 AM",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),
        
                            ],
                          )
        
        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

        
          ],
        ),
      ),
    );
  }

  Widget imageWidget()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        InkWell(
          onTap: () async {
            result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'jpg','png']);
            if (result == null) {
              return null;
            }
            else {
              result?.files.forEach((element) {
                filePath = element.path!;
                fileNameList.add(element.name!);
                setState(() {

                });
                log('FilePath-->>${filePath}');
                log('FilePath-->>${fileNameList}');
              }
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 15),

            decoration: BoxDecoration(
                border: Border.all(color: primary),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload_file_outlined,color: Colors.black,),
                SizedBox(width: 3,),
                Text("Drop files here to upload",
                  style: TextStyle(color:Colors.black),),
              ],),
          ),
        ),

        SizedBox(height: 20,),
        Wrap(
          spacing: 8.0, // Spacing between children
          runSpacing: 8.0, // Spacing between lines
          children: fileNameList.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: primary,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: -2,
                  child: InkWell(
                    onTap: () {
                      // Remove item from the list based on its index
                      if (index >= 0 && index < fileNameList.length) {
                        // Ensure index is valid
                        fileNameList.removeAt(index);
                        // Force a rebuild of the UI to reflect the changes
                        // (assuming this code is inside a StatefulWidget)
                        setState(() {});
                      }                              },
                    child: Icon(Icons.cancel, color: Colors.red),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  void showDialogPicker(BuildContext context){
    selectedDate = showDatePicker(
      context: context,
      helpText: 'Your Date of Birth',
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme:  ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((value) {
      setState(() {
        if(value == null) return;
        reminderDateCt.text = AppUtil.getFormattedDateSimple(value.millisecondsSinceEpoch);

      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void showDialogTimePicker(BuildContext context){
    selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedTime.then((value) {
      setState(() {
        if(value == null) return;
        print(value.period);
        reminderTimeCt.text = "${value.hour} : ${value.minute} ${value.period.name}";
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

}


