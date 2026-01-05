import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:intl/intl.dart';
import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';

class AddProposalView extends StatefulWidget {
  const AddProposalView({super.key});

  @override
  State<AddProposalView> createState() => _AddProposalViewState();

}

class _AddProposalViewState extends State<AddProposalView>with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState(){
    _tabController= TabController(length: 4, vsync: this);
    super.initState();

  }
  int _selectedTabbar = 0;

  TextEditingController subject = TextEditingController();
  TextEditingController cname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController proposalby = TextEditingController();
  TextEditingController intdes = TextEditingController();
  TextEditingController extdes = TextEditingController();
  TextEditingController clubdes = TextEditingController();
  TextEditingController design = TextEditingController();
  TextEditingController designdes = TextEditingController();
  TextEditingController designduration = TextEditingController();
  TextEditingController payterm = TextEditingController();





  TextEditingController state = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController evm1 = TextEditingController();
  String evm1Value = "";
  TextEditingController ivm1 = TextEditingController();
  String ivm1Value = "";
  TextEditingController walkm1 = TextEditingController();
  TextEditingController logom1 = TextEditingController();
  TextEditingController clubm1 = TextEditingController();
  String clubm1Value = "";
  TextEditingController draftm2 = TextEditingController();
  TextEditingController brochurem2 = TextEditingController();
  TextEditingController minutem1 = TextEditingController();
  String minutem1Value = "";
  String walkm1Value = "";
  TextEditingController eview = TextEditingController();
  String eviewValue = "";
  TextEditingController eview1 = TextEditingController();
  String eview1Value = "";
  TextEditingController iview = TextEditingController();
  TextEditingController iview1 = TextEditingController();
  TextEditingController clubview = TextEditingController();
  TextEditingController clubview1 = TextEditingController();
  TextEditingController minute = TextEditingController();
  TextEditingController minute1 = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController projectBranding = TextEditingController();
  TextEditingController subtotal = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController grandtotal = TextEditingController();

  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  bool showContainer = false;

  bool showContainer1 = false;
  Color module1Color = Colors.transparent;
  Color module1Colors = Colors.transparent;
  Color module1TextColor = primary;
  Color module1IconColor = primary;

  Color module2Color = Colors.transparent;
  Color module2Colors = Colors.transparent;
  Color module2TextColor = primary;
  Color module2IconColor = primary;

  bool showContainer3 = false;
  Color module3Color = Colors.transparent;
  Color module3Colors = Colors.transparent;
  Color module3TextColor = primary;
  Color module3IconColor = primary;

  bool showContainer4 = false;
  Color module4Color = Colors.transparent;
  Color module4Colors = Colors.transparent;
  Color module4TextColor = primary;
  Color module4IconColor = primary;

  bool showContainer5 = false;
  Color module5Color = Colors.transparent;
  Color module5Colors = Colors.transparent;
  Color module5TextColor = primary;
  Color module5IconColor = primary;

  bool showContainer6 = false;
  Color module6Color = Colors.transparent;
  Color module6Colors = Colors.transparent;
  Color module6TextColor = primary;
  Color module6IconColor = primary;

  bool showContainer7 = false;
  Color module7Color = Colors.transparent;
  Color module7Colors = Colors.transparent;
  Color module7TextColor = primary;
  Color module7IconColor = primary;

  bool showContainer8 = false;
  Color module8Color = Colors.transparent;
  Color module8Colors = Colors.transparent;
  Color module8TextColor = primary;
  Color module8IconColor = primary;

  bool showContainer9 = false;
  Color module9Color = Colors.transparent;
  Color module9Colors = Colors.transparent;
  Color module9TextColor = primary;
  Color module9IconColor = primary;

  List<String>sourceList = ["Nikita Bohra","Rishab Bohra",];
  String selectSource = "Nikita Bohra";

  List<String>CustomerList = ["Nikita Bohra","Abhi Bohra",];
  String CustomerSource = "Nikita Bohra";

  DateTime? _selectedDate;
  String formatted =DateFormat('dd-MM-yyyy').format(DateTime.now());

  // DateTime? _selectedDate1;
  //String formatted1 = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),

          title: Text(
            "New Proposal", style: TextStyle(fontSize: 18, color: Colors.white),),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              personWidget(),
              TabBar(
                controller: _tabController,
                onTap: (index) {
                  print(index);
                  setState(() {
                    _selectedTabbar = index;
                  });
                },

                tabs: [
                  Tab(child: Text('Module1')),
                  Tab(child: Text('Module2')),
                  Tab(child: Text('Module3')),
                  Tab(child: Text('Module4')),
                ],

              ),
              Builder(builder: (_) {
                if (_selectedTabbar == 0) {
                  return model1();//1st custom tabBarView
                } else if (_selectedTabbar == 1) {
                  return model2();//2nd tabView
                }
                else if (_selectedTabbar == 2) {
                  return model3();//2nd tabView
                } else {
                  return model4(); //3rd tabView
                }
              }),
              commanWidget()


            ],
          ),
        )




    );
  }

  Widget personWidget()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" Subject", style: TextStyle(color: primary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              fontFamily: primaryFont),),
          SizedBox(height: 6,),
          TextField(
            controller: subject,

            maxLines: null,
            keyboardType: TextInputType.multiline,
            minLines: 1,
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
                hintText: "Subject",
                hintStyle: TextStyle(
                    fontFamily: primaryFont,
                    color: Colors.grey,
                    fontSize: 14)
            ),
          ),
          SizedBox(height: 10,),
          Text(" Customer Name", style: TextStyle(color: primary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              fontFamily: primaryFont),),
          SizedBox(height: 6,),
          Container(

            //margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: primary,width: 1)
            ),
            padding:const EdgeInsets.symmetric(horizontal: 10.0),
            child:DropdownSearch<String>(

              popupProps: PopupProps.menu(

                showSearchBox: true,
                constraints: BoxConstraints(minHeight: 100,maxHeight: 200),

                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: CustomerList,

              dropdownDecoratorProps: DropDownDecoratorProps(

                dropdownSearchDecoration: InputDecoration(
                    hintText: "Assigned",
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12)
                ),
              ),
              onChanged: print,
              selectedItem: selectSource,
            ),


          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(" Email", style: TextStyle(
                        color: primary, fontSize: 13, fontWeight: FontWeight
                        .w700, fontFamily: primaryFont),),
                    SizedBox(height: 3,),
                    TextField(
                      controller: email,

                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
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
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Phone", style: TextStyle(
                        color: primary, fontSize: 13, fontWeight: FontWeight
                        .w700, fontFamily: primaryFont),),
                    SizedBox(height: 3,),
                    TextField(
                      controller: phone,

                      maxLines: null,
                      keyboardType: TextInputType.number,
                      minLines: 1,
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
                          hintText: "Phone",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),

                  ],
                ),


              ),

            ],
          ),
          SizedBox(height: 10,),
          Text(" Address", style: TextStyle(color: primary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              fontFamily: primaryFont),),
          SizedBox(height: 6,),
          TextField(
            controller: address,

            maxLines: null,
            keyboardType: TextInputType.multiline,
            minLines: 3,
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
                hintText: "Address",
                hintStyle: TextStyle(
                    fontFamily: primaryFont,
                    color: Colors.grey,
                    fontSize: 14)
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(" City", style: TextStyle(
                        color: primary, fontSize: 13, fontWeight: FontWeight
                        .w700, fontFamily: primaryFont),),
                    SizedBox(height: 3,),
                    TextField(
                      controller: city,

                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
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
                          hintText: "City",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" State", style: TextStyle(
                        color: primary, fontSize: 13, fontWeight: FontWeight
                        .w700, fontFamily: primaryFont),),
                    SizedBox(height: 3,),
                    TextField(
                      controller: state,

                      maxLines: null,
                      keyboardType: TextInputType.number,
                      minLines: 1,
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
                          hintText: "State",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),

                  ],
                ),


              ),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Proposal By", style: TextStyle(
                        color: primary, fontSize: 13, fontWeight: FontWeight
                        .w700, fontFamily: primaryFont),),
                    SizedBox(height: 3,),
                    Container(

                      //margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: primary,width: 1)
                      ),
                      padding:const EdgeInsets.symmetric(horizontal: 10.0),

                      child: DropdownButton(
                        hint: Text("Source",
                          style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down,color: primary,),
                        iconSize: 25,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                        items: sourceList.map((String language) {
                          return  DropdownMenuItem<String>(
                            child:  Text(language),
                            value: language,
                          );
                        }).toList(),
                        value: selectSource,
                        onChanged: (String? value) {

                          setState(() {
                            selectSource = value.toString();
                          });
                        },),
                    ),

                  ],
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Date", style: TextStyle(
                        color: primary, fontSize: 13, fontWeight: FontWeight
                        .w700, fontFamily: primaryFont),),
                    SizedBox(height: 3,),
                    InkWell(
                      onTap: ()async{
                        DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now());
                        if (picked != null && picked != DateTime.now()) {
                          setState(() {
                            final DateFormat formatter = DateFormat('dd-MM-yyyy');
                            formatted = formatter.format(picked);
                            _selectedDate = picked;

                          });
                        }

                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Image.asset('assets/calendar.png',height: 30,),
                            Text(
                              formatted != null
                                  ? '${formatted!.toString()}'
                                  : 'No date selected',
                              style: TextStyle(fontSize: 17),
                            ),
                            Icon(Icons.calendar_month_outlined,color: primary),


                          ],
                        ),
                      ),



                    ),

                  ],
                ),


              ),

            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
  Widget model1()
  {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                  value:isChecked,
                  activeColor: primary,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value??false;
                    });

                  },),
                SizedBox(width: 5,),
                Text("3D RENDERING PACKAGE", style: TextStyle(
                    fontWeight: FontWeight.bold, color: primary)),
              ],
            ),

            Divider(
              height: 30,
              color: primary,
              thickness: 1,
            ), //Exterior View Calculation
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: module4Colors, // Use the variable here
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),

              child: InkWell(
                onTap: () {
                  setState(() {
                    showContainer4 = !showContainer4;
                    module4Colors =
                    showContainer4 ? primary : Colors.transparent;
                    module4TextColor =
                    showContainer4 ? Colors.white : primary;
                    module4IconColor =
                    showContainer4 ? Colors.white : primary;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exterior", style: TextStyle(
                          color: module4TextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: primaryFont),),
                      Icon(Icons.keyboard_arrow_right_outlined,
                        color: module4IconColor, size: 25,),
                    ],
                  ),
                ),

              ),),
            Visibility(
              visible: showContainer4,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex:1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),
                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: evm1,
                                enabled: !isChecked,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),
                                textAlign: TextAlign.center,

                                //maxLines: null,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                readOnly: false,
                                onChanged: (value) {

                                  // Update eview text field when evm1 changes
                                  evm1Value  = "${value}";

                                  eview1.text =  updateTotal(eview.text,evm1.text);

                                  setState(() {


                                  });

                                  //eview.text= (evm1.text.isEmpty ? null : eview.text+"X")!;

                                },




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
                                        horizontal: 5, vertical: 0),
                                    labelText: "No of views",
                                    labelStyle: TextStyle(fontSize: 10,color: primary),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 14)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),

                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: eview,
                                enabled: !isChecked,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                readOnly: false,
                                onChanged: (value) {
                                  eview1.text =  updateTotal(eview.text,evm1.text);
                                  total.text =  updateSum(eview1.text,iview1.text,clubview1.text,minute1.text);
                                  subtotal.text = updateSum(total.text,projectBranding.text,"0","0");
                                  gst.text = ((double.parse(subtotal.text.toString())*18)/100).toString();
                                  grandtotal.text =  updateSum("0","",subtotal.text,gst.text);
                                  setState(() {

                                  });
                                },
                                decoration: InputDecoration(

                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          6)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primary,),
                                      borderRadius: BorderRadius.circular(
                                          6)
                                  ),
                                  prefixIconConstraints: BoxConstraints(minWidth: 20,maxWidth: 60),
                                  prefixIcon: evm1Value.isEmpty
                                      ? null
                                      : Padding(
                                    padding: const EdgeInsets.only(top: 7.0,bottom:6,left: 4),
                                    child: Text( evm1Value+"X",style: TextStyle(color: Colors.black,fontSize: 12),),
                                  ) ,
                                  contentPadding:  EdgeInsets
                                      .symmetric(
                                      horizontal: evm1Value.isEmpty?5:0, vertical: 6),
                                  labelText: "Per views",
                                  labelStyle: TextStyle(fontSize: 10,color: primary),
                                  hintStyle: TextStyle(
                                      fontFamily: primaryFont,
                                      color: Colors.grey,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),

                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: eview1,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),
                                readOnly: true,

                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,


                                decoration: InputDecoration(

                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            6)),

                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primary,),
                                        borderRadius: BorderRadius.circular(
                                            6)
                                    ),
                                    contentPadding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 15, vertical: 0),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 14)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: extdes,
                      enabled: !isChecked,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      readOnly: false,
                      decoration: InputDecoration(
                          counterText: "",

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
                          //hintText: "Subject",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Divider(
              height: 30,
              color: primary,
              thickness: 0.3,
            ),

            //Interior View Calculation
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: module5Colors, // Use the variable here
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),

              child: InkWell(
                onTap: () {
                  setState(() {
                    showContainer5 = !showContainer5;
                    module5Colors =
                    showContainer5 ? primary : Colors.transparent;
                    module5TextColor =
                    showContainer5 ? Colors.white : primary;
                    module5IconColor =
                    showContainer5 ? Colors.white : primary;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Interior", style: TextStyle(
                          color: module5TextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: primaryFont),),
                      Icon(Icons.keyboard_arrow_right_outlined,
                        color: module5IconColor, size: 25,),
                    ],
                  ),
                ),

              ),),
            Visibility(
              visible: showContainer5,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child:Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),

                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: ivm1,
                                enabled: !isChecked,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                readOnly: false,
                                onChanged: (value) {
                                  // Update eview text field when ivm1 changes
                                  ivm1Value  = "${value}";
                                  iview1.text =  updateTotal(iview.text,ivm1.text);


                                  setState(() {

                                  });
                                  //eview.text= (evm1.text.isEmpty ? null : eview.text+"X")!;

                                },
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
                                        horizontal: 5, vertical: 0),
                                    labelText: "No of views",
                                    labelStyle: TextStyle(fontSize: 10,color: primary),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 14)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),
                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: iview,
                                enabled: !isChecked,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),

                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                readOnly: false,
                                onChanged: (value) {
                                  iview1.text =  updateTotal(iview.text,ivm1.text);
                                  total.text =  updateSum(eview1.text,iview1.text,clubview1.text,minute1.text);
                                  subtotal.text = updateSum(total.text,projectBranding.text,"0","0");
                                  gst.text = ((double.parse(subtotal.text.toString())*18)/100).toString();
                                  grandtotal.text =  updateSum("0","",subtotal.text,gst.text);
                                  setState(() {

                                  });
                                },
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            6)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primary,),
                                        borderRadius: BorderRadius.circular(
                                            6)
                                    ),
                                    prefixIconConstraints: BoxConstraints(minWidth: 20,maxWidth: 60),
                                    prefixIcon: ivm1Value.isEmpty
                                        ? null
                                        :Padding(
                                      padding: const EdgeInsets.only(top: 7.0,bottom:6,left: 4),
                                      child: Text( ivm1Value+"X",style: TextStyle(color: Colors.black,fontSize: 12),),
                                    ) ,
                                    contentPadding:  EdgeInsets
                                        .symmetric(
                                        horizontal:ivm1Value.isEmpty?5: 0, vertical: 0),
                                    labelText: "Per views",
                                    labelStyle: TextStyle(color: primary,fontSize: 10),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 12)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),
                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: iview1,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),
                                readOnly: true,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            6)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primary,),
                                        borderRadius: BorderRadius.circular(
                                            6)
                                    ),

                                    contentPadding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 15, vertical: 0),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 14)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: intdes,
                      enabled: !isChecked,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      readOnly: false,
                      decoration: InputDecoration(
                          counterText: "",

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
                          //hintText: "Subject",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Divider(
              height: 30,
              color: primary,
              thickness: 0.3,
            ),
            //Rooftop Amenities Views Calculation
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: module6Colors, // Use the variable here
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),

              child: InkWell(
                onTap: () {
                  setState(() {
                    showContainer6 = !showContainer6;
                    module6Colors =
                    showContainer6 ? primary : Colors.transparent;
                    module6TextColor =
                    showContainer6 ? Colors.white : primary;
                    module6IconColor =
                    showContainer6 ? Colors.white : primary;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Club/Rooftop Amenities", style: TextStyle(
                          color: module6TextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: primaryFont),),
                      Icon(Icons.keyboard_arrow_right_outlined,
                        color: module6IconColor, size: 25,),
                    ],
                  ),
                ),

              ),),
            Visibility(
              visible: showContainer6,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child:Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),
                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: clubm1,
                                enabled: !isChecked,
                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                keyboardType:TextInputType.number,
                                minLines: 1,
                                readOnly: false,
                                onChanged: (value) {
                                  // Update eview text field when clubm1 changes
                                  clubm1Value  = "${value}";
                                  clubview1.text =  updateTotal(clubview.text,clubm1.text);


                                  setState(() {

                                  });
                                  //eview.text= (evm1.text.isEmpty ? null : eview.text+"X")!;

                                },
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
                                        horizontal: 5, vertical: 0),
                                    labelText: "No of views",
                                    labelStyle: TextStyle(fontSize: 10,color: primary),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 14)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),
                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: clubview,
                                enabled: !isChecked,

                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),

                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                readOnly: false,
                                onChanged: (value) {
                                  clubview1.text =  updateTotal(clubview.text,clubm1.text);
                                  total.text =  updateSum(eview1.text,iview1.text,clubview1.text,minute1.text);
                                  subtotal.text = updateSum(total.text,projectBranding.text,"0","0");
                                  gst.text = ((double.parse(subtotal.text.toString())*18)/100).toString();
                                  grandtotal.text =  updateSum("0","",subtotal.text,gst.text);

                                  setState(() {

                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            6)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primary,),
                                        borderRadius: BorderRadius.circular(
                                            6)
                                    ),
                                    prefixIconConstraints: BoxConstraints(minWidth: 20,maxWidth: 60),
                                    prefixIcon: clubm1Value.isEmpty
                                        ? null
                                        :Padding(
                                      padding: const EdgeInsets.only(top: 7.0,bottom:6,left: 4),
                                      child: Text( clubm1Value+"X",style: TextStyle(color: Colors.black,fontSize: 12),),
                                    ) ,
                                    contentPadding:  EdgeInsets
                                        .symmetric(
                                        horizontal: clubm1Value.isEmpty?5:0, vertical: 0),
                                    labelText: "Per views" ,
                                    labelStyle:TextStyle(color: primary,fontSize: 10),
                                    hintStyle: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.grey,
                                    fontSize: 12)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee, size: 18,),
                            Container(
                              height: 30,
                              width: 90,
                              child: TextField(
                                controller: clubview1,
                                enabled: !isChecked,

                                style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 12),

                                readOnly: false,

                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            6)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primary,),
                                        borderRadius: BorderRadius.circular(
                                            6)
                                    ),

                                    contentPadding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 15, vertical: 0),
                                    hintStyle: TextStyle(
                                        fontFamily: primaryFont,
                                        color: Colors.grey,
                                        fontSize: 14)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: clubdes,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      readOnly: true,
                      decoration: InputDecoration(
                          counterText: "",

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
                          //hintText: "Subject",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.grey,
                              fontSize: 14)
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Divider(
              height: 30,
              color: primary,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Total"),
                SizedBox(width: 8,),
                Icon(Icons.currency_rupee, size: 18,),
                Container(
                  height: 30,
                  width: 108,
                  child: TextField(
                    controller: total,
                    style: TextStyle(
                        fontFamily: primaryFont,
                        color: Colors.black,
                        fontSize: 14),
                    readOnly: true,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
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
                            horizontal: 15, vertical: 0),
                        hintStyle: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.grey,
                            fontSize: 14)
                    ),
                  ),

                ),
              ],
            ),
          ]
      ),
    );
  }
  Widget model2()
  {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value:isChecked1,
                activeColor: primary,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked1 = value??false;
                  });

                },),
              SizedBox(width: 5,),
              Text("WALKTHROUGH",style: TextStyle(
                  fontWeight: FontWeight.bold, color: primary)),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex:1,
                child:Container(
                  height:30,
                  child: Row(
                    children: [
                      Icon(Icons.currency_rupee, size: 18,),
                      Container(
                        height: 30,
                        width: 90,
                        child: TextField(
                          controller: walkm1,
                          enabled: !isChecked1,
                          style: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.black,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          readOnly: false,
                          //minLines: 1,
                          onChanged: (value){
                            walkm1Value  = "${value}";
                            minute1.text =  updateTotal(minute.text,walkm1.text);

                            setState(() {

                            });

                          },

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
                                  horizontal: 5, vertical: 0),
                              labelText: "Time Duration" ,
                              labelStyle:TextStyle(color: primary,fontSize: 10),
                              hintStyle: TextStyle(
                                  fontFamily: primaryFont,
                                  color: Colors.grey,
                                  fontSize: 14)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(Icons.currency_rupee, size: 18,),
                    Container(
                      height: 30,
                      width: 90,
                      child: TextField(
                        controller: minute,
                        enabled: !isChecked1,
                        style: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.black,
                            fontSize: 12),

                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        readOnly: false,
                        onChanged: (value) {
                          minute1.text =  updateTotal(minute.text,walkm1.text);
                          total.text =  updateSum(eview1.text,iview1.text,clubview1.text,"0");
                          subtotal.text = updateSum(total.text,minute1.text,projectBranding.text,"0",);
                          gst.text = ((double.parse(subtotal.text.toString())*18)/100).toString();
                          grandtotal.text =  updateSum("0","0",subtotal.text,gst.text);
                          setState(() {

                          });
                        },
                        decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                    6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,),
                                borderRadius: BorderRadius.circular(
                                    6)
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 20,maxWidth: 60),
                            prefixIcon: walkm1Value.isEmpty
                                ? null
                                :Padding(
                              padding: const EdgeInsets.only(top: 7.0,bottom:6,left: 4),
                              child: Text( walkm1Value+"X",style: TextStyle(color: Colors.black,fontSize: 12),),
                            ) ,

                            contentPadding:  EdgeInsets
                                .symmetric(
                                horizontal: walkm1Value.isEmpty? 5:0, vertical: 0),
                            labelText: "Per minute" ,
                            labelStyle:TextStyle(color: primary,fontSize: 10),
                            hintStyle: TextStyle(
                                fontFamily: primaryFont,
                                color: Colors.grey,
                                fontSize: 12)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(Icons.currency_rupee, size: 18,),
                    Container(
                      height: 30,
                      width: 90,
                      child: TextField(
                        controller: minute1,
                        style: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.black,
                            fontSize: 12),
                        readOnly: true,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                    6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,),
                                borderRadius: BorderRadius.circular(
                                    6)
                            ),
                            contentPadding: const EdgeInsets
                                .symmetric(
                                horizontal: 15, vertical: 0),
                            hintStyle: TextStyle(
                                fontFamily: primaryFont,
                                color: Colors.grey,
                                fontSize: 14)
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget model3()
  {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value:isChecked2,
                activeColor: primary,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked2 =value??false;
                  });

                },),
              SizedBox(width: 5,),
              Text("PROJECT BRANDING", style: TextStyle(
                  fontWeight: FontWeight.bold, color: primary)),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                  flex:2,
                  child: Text("Project Branding & Consultation Charge",)),
              Icon(Icons.currency_rupee, size: 18,),
              Expanded(
                flex: 1,
                child: Container(
                  width: 90,
                  height: 30,
                  child: TextField(
                    controller: projectBranding,
                    enabled: !isChecked2,
                    style: TextStyle(
                        fontFamily: primaryFont,
                        color: Colors.black,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    minLines: 1,
                    readOnly: false,
                    onChanged: (value){
                      subtotal.text = updateSum(total.text,minute1.text,projectBranding.text,"0",);
                      gst.text = ((double.parse(subtotal.text.toString())*18)/100).toString();
                      grandtotal.text =  updateSum("0","0",subtotal.text,gst.text);
                      setState(() {
                      });


                    },
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
                            horizontal: 15, vertical: 0),
                        hintStyle: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.grey,
                            fontSize: 14)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget model4()
  {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value:isChecked3,
                activeColor: primary,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked3 = value??false;

                  });

                },),
                SizedBox(width: 5,),
              Text("DESIGN RETAINSHIP", style: TextStyle(
                  fontWeight: FontWeight.bold, color: primary)),
            ],
          ),
          SizedBox(height: 5,),
          Row(
              children: [
                Text("Design Retainship",),
                SizedBox(width: 5,),
                Container(
                  width: 120,
                  height: 30,
                  child: TextField(
                    controller: designduration,

                    maxLines: null,
                    enabled:  !isChecked3,
                    keyboardType: TextInputType.number,
                    minLines: 1,
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
                            horizontal: 5, vertical: 0),
                        labelText: "Duration",
                        labelStyle:TextStyle(color: primary,fontSize: 10),

                        hintStyle: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.grey,
                            fontSize: 14)
                    ),
                  ),
                ),

              ],
            ),
          SizedBox(height: 10,),
          TextField(
            controller: designdes,

            enabled:  !isChecked3,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            minLines: 3,
           readOnly: false, // Set this to true when you want it to be read-only

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
                hintText: "",
                hintStyle: TextStyle(
                    fontFamily: primaryFont,
                    color: Colors.grey,
                    fontSize: 14)
            ),
          ),
          SizedBox(height: 10,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Payment Term"),
                SizedBox(height: 5,),

                TextField(
                  controller: payterm,
enabled: !isChecked3,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  readOnly: false,
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
                      //labelText: "Payment term",
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),
              ],
            ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.currency_rupee, size: 18,),

                Container(
                  height: 30,
                  width: 90,
                  child: TextField(
                    controller: design,
                    enabled: !isChecked3,

                    style: TextStyle(
                        fontFamily: primaryFont,
                        color: Colors.black,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    minLines: 1,
                    readOnly: false,
                    onChanged: (value){
                      subtotal.text = updateSum(total.text,minute1.text,projectBranding.text,design.text,);
                      gst.text = ((double.parse(subtotal.text.toString())*18)/100).toString();
                      grandtotal.text =  updateSum("0","0",subtotal.text,gst.text);
                      setState(() {
                      });


                    },
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
                            horizontal: 15, vertical: 0),
                        hintStyle: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.grey,
                            fontSize: 14)
                    ),
                  ),
                ),
              ],
            )


        ],
      ),
    );
  }

  Widget commanWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 30,
            color: primary,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Sub Total"),
              SizedBox(width: 8,),
              Icon(Icons.currency_rupee, size: 18,),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: subtotal,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 14),
                  readOnly: true,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),

              ),
            ],
          ),
          Divider(
            height: 30,
            color: primary,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("GST 18"),
              Icon(Icons.percent, size: 12,),
              SizedBox(width: 8,),
              Icon(Icons.currency_rupee, size: 18,),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: gst,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 14),
                  readOnly: true,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),

              ),
            ],
          ),
          Divider(
            height: 30,
            color: primary,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Grand Total"),
              SizedBox(width: 8,),
              Icon(Icons.currency_rupee, size: 18,),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: grandtotal,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 16),
                  readOnly: true,
                  maxLines: 1,
                  /*style: TextStyle(
                              fontFamily: primaryFont,
                              color: Colors.black,
                              fontSize: 14),*/
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),

              ),
            ],
          ),
          Divider(
            height: 30,
            color: primary,
            thickness: 1,
          ),
          Text("  COMPLETION TIME", style: TextStyle(
              fontWeight: FontWeight.bold, color: primary)),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("  Draft of 3D view  working days:"),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: draftm2,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("  Walkthrough after working days:"),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: time,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("  Project logo within  working days:"),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: logom1,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("  Brochure within working days:"),
              Container(
                height: 30,
                width: 90,
                child: TextField(
                  controller: brochurem2,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      color: Colors.black,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  minLines: 1,
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
                          horizontal: 15, vertical: 0),
                      hintStyle: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.grey,
                          fontSize: 14)
                  ),
                ),
              ),


            ],
          ),
          Divider(
            height: 30,
            color: primary,
            thickness: 1,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primary),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: primary)
                      ),
                    )
                ),
                child: Text(
                  "Save ", style: TextStyle(color: Colors.white),),
                onPressed: () {
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  String updateTotal(String firstValue,String secondValue) {
    if(firstValue.isNotEmpty&&secondValue.isNotEmpty ){
      double value1 = double.tryParse(firstValue) ?? 0.0;
      double value2 = double.tryParse(secondValue) ?? 0.0;
      double total = value1 * value2;
      return total.toString();
    }
    else {
      return "";
    }// Assuming minute.text and minute1.text contain the numeric values
  }
  String updateSum(String firstValue,String secondValue,String thridValue,String forthValue) {
    double value1 = double.tryParse(firstValue) ?? 0.0;
    double value2 = double.tryParse(secondValue) ?? 0.0;
    double value3 = double.tryParse(thridValue) ?? 0.0;
    double value4 = double.tryParse(forthValue) ?? 0.0;
    double sum = value1 + value2 + value3 + value4;
    return sum.toString();
    // Assuming minute.text and minute1.text contain the numeric values
  }
}