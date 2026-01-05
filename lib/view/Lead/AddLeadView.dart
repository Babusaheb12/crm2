import 'package:crm/appcomman/AppUtil.dart';
import 'package:crm/helper/request/lead_add_request.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';

class AddLeadView extends StatefulWidget {
  String? name;
  String? contact;
   AddLeadView({Key? key,this.name,this.contact}) : super(key: key);

  @override
  State<AddLeadView> createState() => _AddLeadViewState();
}

class _AddLeadViewState extends State<AddLeadView> {


  TextEditingController nameCt = TextEditingController();
  TextEditingController addressCt = TextEditingController();
  TextEditingController positionCt = TextEditingController();
  TextEditingController cityCt = TextEditingController();
  TextEditingController emailCt = TextEditingController();
  TextEditingController stateCt = TextEditingController();
  TextEditingController websiteCt = TextEditingController();
  TextEditingController phoneCt = TextEditingController();
  TextEditingController zipCt = TextEditingController();
  TextEditingController companyCt = TextEditingController();
  TextEditingController descriptionCt = TextEditingController();
  List<String>leadList = ["Nothing Lead","Customer"];
  List<String>groupList = ["Nothing Group","Group1","Group2"];
  List<String>sourceList = ["Nothing Source","Google","Facebook"];
  List<String>assignedList = ["Nothing Assigned","Assigned1","Assigned2"];
  List<String>languageList = ["System Language","Catalan","Chinese","Dutch","English","French","German","Indonesia","Italian",
    "Japanese","Persian","Polish","Portuguese","Russian","Spanish","Swedish","Turkish"];
  String selectLanguage = "System Language";

  String selectCountry = "System Country";
  List<String> countryNames = [
    'System Country',
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea, North',
    'Korea, South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

 String selectLead  = 'Nothing Lead';
 String selectGroup  = 'Nothing Group';
 String selectAssign  = 'Nothing Assigned';
 String selectSource = 'Nothing Source';
 String userID = "";


 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    phoneCt = TextEditingController(text: widget.contact);
    nameCt = TextEditingController(text: widget.name);

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text("Add Lead",style: TextStyle(color: Colors.white),),),

       body: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 15,),


             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                     child: Text("Name*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   SizedBox(
                     height: 45,
                     child: TextField(
                       controller: nameCt,
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

                           contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                           hintText: "Name",
                           hintStyle: TextStyle(
                               fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                     ),
                   ),
                 ],
               ),
             ),
             /*Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: SizedBox(
                 height: 45,
                 child: TextField(
                   controller: addressCt,
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

                       contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                       hintText: "Address",
                       hintStyle: TextStyle(
                           fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: SizedBox(
                 height: 45,
                 child: TextField(
                   controller: positionCt,
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

                       contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                       hintText: "Position",
                       hintStyle: TextStyle(
                           fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: SizedBox(
                 height: 45,
                 child: TextField(
                   controller: cityCt,
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

                       contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                       hintText: "City",
                       hintStyle: TextStyle(
                           fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                 ),
               ),
             ),*/

            /* Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: SizedBox(
                 height: 45,
                 child: TextField(
                   controller: stateCt,
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

                       contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                       hintText: "State",
                       hintStyle: TextStyle(
                           fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: SizedBox(
                 height: 45,
                 child: TextField(
                   controller: websiteCt,
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

                       contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                       hintText: "Website",
                       hintStyle: TextStyle(
                           fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Container(

                 margin: EdgeInsets.symmetric(horizontal: 10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     border: Border.all(color: primary,width: 1)
                 ),
                 padding:const EdgeInsets.symmetric(horizontal: 10.0),

                 child: DropdownButton(
                   hint: Text("Country",
                     style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                   dropdownColor: Colors.white,
                   icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
                   iconSize: 25,
                   isExpanded: true,
                   underline: SizedBox(),
                   style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                   items: countryNames.map((String language) {
                     return  DropdownMenuItem<String>(
                       child:  Text(language),
                       value: language,
                     );
                   }).toList(),
                   value: selectCountry,
                   onChanged: (String? value) {

                     setState(() {
                       selectCountry = value.toString();
                     });
                   },),
               ),
             ),*/
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                     child: Text("Phone No.",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   SizedBox(
                     height: 45,
                     child: TextField(
                       controller: phoneCt,
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

                           contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                           hintText: "Phone No.",
                           hintStyle: TextStyle(
                               fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                     ),
                   ),
                 ],
               ),
             ),
            /* Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: SizedBox(
                 height: 45,
                 child: TextField(
                   controller: zipCt,
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

                       contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                       hintText: "Zip Code",
                       hintStyle: TextStyle(
                           fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                 ),
               ),
             ),*/
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                     child: Text("Company Name",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   SizedBox(
                     height: 45,
                     child: TextField(
                       controller: companyCt,
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

                           contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                           hintText: "Company",
                           hintStyle: TextStyle(
                               fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                     ),
                   ),
                 ],
               ),
             ),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                     child: Text("Email",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   SizedBox(
                     height: 45,
                     child: TextField(
                       controller: emailCt,
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

                           contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                           hintText: "Email Address",
                           hintStyle: TextStyle(
                               fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                     ),
                   ),
                 ],
               ),
             ),

            /* Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                     child: Text("Group*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   Container(

                     margin: EdgeInsets.symmetric(horizontal: 10),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: primary,width: 1)
                     ),
                     padding:const EdgeInsets.symmetric(horizontal: 10.0),

                     child: DropdownButton(
                       hint: Text("Group",
                         style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                       dropdownColor: Colors.white,
                       icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
                       iconSize: 25,
                       isExpanded: true,
                       underline: SizedBox(),
                       style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                       items: groupList.map((String language) {
                         return  DropdownMenuItem<String>(
                           child:  Text(language),
                           value: language,
                         );
                       }).toList(),
                       value: selectGroup,
                       onChanged: (String? value) {

                         setState(() {
                           selectGroup = value.toString();
                         });
                       },),
                   ),
                 ],
               ),
             ),*/
            /* Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Container(

                 margin: EdgeInsets.symmetric(horizontal: 10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     border: Border.all(color: primary,width: 1)
                 ),
                 padding:const EdgeInsets.symmetric(horizontal: 10.0),

                 child: DropdownButton(
                   hint: Text("Language",
                     style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                   dropdownColor: Colors.white,
                   icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
                   iconSize: 25,
                   isExpanded: true,
                   underline: SizedBox(),
                   style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                   items: languageList.map((String language) {
                     return  DropdownMenuItem<String>(
                       child:  Text(language),
                       value: language,
                     );
                   }).toList(),
                   value: selectLanguage,
                   onChanged: (String? value) {

                     setState(() {
                       selectLanguage = value.toString();
                     });
                   },),
               ),
             ),*/

             Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                     child: Text("Source*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   Container(
                     height: 50,

                     margin: EdgeInsets.symmetric(horizontal: 10),
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
                       items: sourceList,

                       dropdownDecoratorProps: DropDownDecoratorProps(

                         dropdownSearchDecoration: InputDecoration(
                             disabledBorder: InputBorder.none,
                             enabledBorder: InputBorder.none,
                           hintText: "Source",
                           contentPadding: EdgeInsets.symmetric(vertical: 12)
                         ),
                       ),
                       onChanged: print,
                       selectedItem: selectSource,
                     ),




                     /*DropdownButton(
                       hint: Text("Source",
                         style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                       dropdownColor: Colors.white,
                       icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
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
                       },),*/
                   ),
                 ],
               ),
             ),

             Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                     child: Text("Status*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   Container(
                     height: 50,

                     margin: EdgeInsets.symmetric(horizontal: 10),
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
                       items: sourceList,

                       dropdownDecoratorProps: DropDownDecoratorProps(

                         dropdownSearchDecoration: InputDecoration(

                           hintText: "Status",
                           disabledBorder: InputBorder.none,
                           enabledBorder: InputBorder.none,
                           contentPadding: EdgeInsets.symmetric(vertical: 12)
                         ),
                       ),
                       onChanged: print,
                       selectedItem: selectSource,
                     ),




                     /*DropdownButton(
                       hint: Text("Source",
                         style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                       dropdownColor: Colors.white,
                       icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
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
                       },),*/
                   ),
                 ],
               ),
             ),

             Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                     child: Text("Assigned*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   Container(
                     height: 50,

                     margin: EdgeInsets.symmetric(horizontal: 10),
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
                       items: sourceList,

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




                     /*DropdownButton(
                       hint: Text("Source",
                         style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                       dropdownColor: Colors.white,
                       icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
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
                       },),*/
                   ),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
               child: TextField(
                 controller: descriptionCt,

                 maxLines: null,
                 keyboardType: TextInputType.multiline,
                 minLines: 3,
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


                     contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                     hintText: "Description",
                     hintStyle: TextStyle(
                         fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
               ),
             ),

            /* SizedBox(height: 15,),

             Container(
               width: double.infinity,
               height: 1,
               color: primary,
             ),*/



             /*Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                     child: Text("Lead Status*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   Container(

                     margin: EdgeInsets.symmetric(horizontal: 10),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: primary,width: 1)
                     ),
                     padding:const EdgeInsets.symmetric(horizontal: 10.0),

                     child: DropdownButton(
                       hint: Text("Lead Status",
                         style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                       dropdownColor: Colors.white,
                       icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
                       iconSize: 25,
                       isExpanded: true,
                       underline: SizedBox(),
                       style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                       items: leadList.map((String language) {
                         return  DropdownMenuItem<String>(
                           child:  Text(language),
                           value: language,
                         );
                       }).toList(),
                       value: selectLead,
                       onChanged: (String? value) {

                         setState(() {
                           selectLead = value.toString();
                         });
                       },),
                   ),
                 ],
               ),
             ),*/





             /*Padding(
               padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                     child: Text("Assigned*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                   ),
                   Container(

                     margin: EdgeInsets.symmetric(horizontal: 10),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         border: Border.all(color: primary,width: 1)
                     ),
                     padding:const EdgeInsets.symmetric(horizontal: 10.0),

                     child: DropdownButton(
                       hint: Text("Assigned",
                         style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                       dropdownColor: Colors.white,
                       icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
                       iconSize: 25,
                       isExpanded: true,
                       underline: SizedBox(),
                       style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                       items: assignedList.map((String language) {
                         return  DropdownMenuItem<String>(
                           child:  Text(language),
                           value: language,
                         );
                       }).toList(),
                       value: selectAssign,
                       onChanged: (String? value) {

                         setState(() {
                           selectAssign = value.toString();
                         });
                       },),
                   ),
                 ],
               ),
             ),*/



             SizedBox(height: 20,),

             InkWell(
               onTap: (){
                /* if(nameCt.text.isEmpty)
                   {
                     AppUtil.showToast("Enter name", "i");
                   }
                 else if(selectGroup.toLowerCase() =="nothing group")
                   {
                     AppUtil.showToast("select group", "i");
                   }
                 else
                 {
                   // AddLeadRequest request = AddLeadRequest(userID: );
                 }*/
               },
               child: Container(
                 width: double.infinity,
                 alignment: Alignment.center,
                 padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.3),
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: primary),
                 child: Text("Save",style: TextStyle(fontSize: 14,color: Colors.white),),
               ),
             ),
             SizedBox(height: 20,),
           ],
         ),
       ),



    );
  }
}
