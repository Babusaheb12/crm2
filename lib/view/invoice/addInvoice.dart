import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';
import '../../appcomman/AppUtil.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({super.key});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {

  List<TextEditingController> namedescription = [];
  List<TextEditingController> item = [];
  List<TextEditingController> qty = [];
  List<TextEditingController> tax = [];
  List<TextEditingController> rate = [];
  List<TextEditingController> amount = [];


  TextEditingController discount = TextEditingController();
  TextEditingController adjustment = TextEditingController();
  TextEditingController tamount = TextEditingController();
  TextEditingController damount = TextEditingController();
  TextEditingController aamount = TextEditingController();
  TextEditingController totalamount = TextEditingController();
  TextEditingController nameCt = TextEditingController();
  TextEditingController addressCt = TextEditingController();
  TextEditingController positionCt = TextEditingController();
  TextEditingController cityCt = TextEditingController();
  TextEditingController emailCt = TextEditingController();
  TextEditingController stateCt = TextEditingController();
  TextEditingController websiteCt = TextEditingController();
  TextEditingController invoiceDateCT = TextEditingController();
  TextEditingController dueDateCT = TextEditingController();
  TextEditingController zipCt = TextEditingController();
  TextEditingController companyCt = TextEditingController();
  TextEditingController descriptionCt = TextEditingController();
  int itemQty = 0;
  List<String>leadList = ["Nothing Lead","Customer"];
  List<String>groupList = ["Nothing Group","Group1","Group2"];
  List<String>sourceList = ["Nothing Customer","Google","Facebook"];
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
  String selectSource = 'Nothing Customer';
  String userID = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();





    setState(() {
      for(int i=0; i<itemQty; i++)
      {
        item.add(TextEditingController(text: ""));
        namedescription.add(TextEditingController(text: ""));
        qty.add(TextEditingController(text: ""));
        tax.add(TextEditingController(text: ""));
        rate.add(TextEditingController(text: ""));
        amount.add(TextEditingController(text: ""));
      }
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
        title: Text("Create New Estimate",style: TextStyle(color: Colors.white),),),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),


            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                    child: Text("Customer*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ),
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: primary,width: 1)
                    ),
                    padding:const EdgeInsets.symmetric(horizontal: 10.0),

                    child: DropdownButton(
                      hint: Text("Customer",
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
                      },),
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
                    child: Text("Estimate Number*",style: TextStyle(fontSize: 12,color: Colors.grey),),
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
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                            child: Text("EST -",style: TextStyle(fontSize: 14),),
                          ),

                          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                          hintText: "Number",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ),


            Row(
              children: [

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                          child: Text("Estimate Date",style: TextStyle(fontSize: 12,color: Colors.grey),),
                        ),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            controller: invoiceDateCT,
                            // focusNode: memberNameNode,
                            readOnly: true,
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary:  primary, // <-- SEE HERE
                                        onPrimary:  Colors.white, // <-- SEE HERE
                                        onSurface: primary, // <-- SEE HERE
                                      ),
                                    ), child: child!,
                                  );
                                },

                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  invoiceDateCT.text =
                                      DateFormat('dd MMM yy').format(selectedDate);
                                }
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

                                suffixIcon: Icon(Icons.calendar_today,color: primary,size: 15,),

                                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                hintText: "Invoice Date",
                                hintStyle: TextStyle(
                                    fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  ),),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 3),
                          child: Text("Expiry Date",style: TextStyle(fontSize: 12,color: Colors.grey),),
                        ),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            controller: dueDateCT,
                            // focusNode: memberNameNode,
                            readOnly: true,
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary:  primary, // <-- SEE HERE
                                        onPrimary:  Colors.white, // <-- SEE HERE
                                        onSurface: primary, // <-- SEE HERE
                                      ),
                                    ), child: child!,
                                  );
                                },

                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  dueDateCT.text =
                                      DateFormat('dd MMM yy').format(selectedDate);
                                }
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

                                suffixIcon: Icon(Icons.calendar_today,color: primary,size: 15,),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                                hintText: "Due Date",
                                hintStyle: TextStyle(
                                    fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  ),),

              ],
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                    child:
                    Text("Admin Note ",style: TextStyle(fontSize: 12,color: Colors.grey),),),

                  TextField(
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
                ],
              ),
            ),
            //heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Show quantity as:',style: TextStyle(fontSize: 12,),),
                  SizedBox(width: 10,),
                  Text("Qty",style: TextStyle(fontSize: 12,),),
                  SizedBox(width: 10,),

                  Text("Hours",style: TextStyle(fontSize: 12,),),
                  SizedBox(width: 10,),

                  Text("Qty/Hours",style: TextStyle(fontSize: 12,),)
                ],
              ),
            ),

            /*Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                          child:Text("Item ",style: TextStyle(fontSize: 12,color: Colors.grey),),),
                        TextField(
                          controller: item,

                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
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
                                  fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(width: 1,),
                  Container(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                          child:Text("Description ",style: TextStyle(fontSize: 12,color: Colors.grey),),),
                        TextField(
                          controller: namedescription,

                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
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
                              hintText: "Long description",
                              hintStyle: TextStyle(
                                  fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                          ),
                        ),

                      ],
                    ),
                  ),



                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                            child:Text("Qty ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                          Container(
                            height: 45,
                            child: TextField(
                              controller: qty,

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
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  hintText: "Unit",
                                  hintStyle: TextStyle(
                                      fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                            child:Text("Rate ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                          Container(
                            height:45,
                            child: TextField(
                              controller: rate,

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
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                hintText: "Rate",
                                hintStyle: TextStyle(
                                    fontFamily: primaryFont, color: Colors.grey, fontSize: 14),
                                suffixIcon: Icon(Icons.percent_outlined),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                            child:Text("Tax ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                          Container(
                            height: 45,
                            child: TextField(
                              controller: tax,

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
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                hintText: "No Text",
                                hintStyle: TextStyle(
                                    fontFamily: primaryFont, color: Colors.grey, fontSize: 14),
                                suffixIcon: Icon(Icons.percent),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),




                ],
              ),
            ),*/

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: (){
                        setState(() {
                          itemQty++;
                        });
                      },child: Icon(Icons.add_circle,color: Colors.blue,)),
                  SizedBox(width: 6,),
                  InkWell(
                      onTap: (){
                        setState(() {
                          itemQty++;
                          item.add(TextEditingController(text: ""));
                          namedescription.add(TextEditingController(text: ""));
                          qty.add(TextEditingController(text: ""));
                          tax.add(TextEditingController(text: ""));
                          rate.add(TextEditingController(text: ""));
                          amount.add(TextEditingController(text: ""));
                        });
                      },
                      child: Text("Add Item",style: TextStyle(fontSize: 16,color: Colors.blue),))
                ],
              ),
            ),

            ListView.builder(
              itemCount: itemQty,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                        height: 95,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: 180,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      child:Text("Item ",style: TextStyle(fontSize: 12,color: Colors.grey),),),
                                    TextField(
                                      controller: item[index],

                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 2,
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
                                              fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(width: 1,),
                              Container(
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      child:Text("Description ",style: TextStyle(fontSize: 12,color: Colors.grey),),),
                                    TextField(
                                      controller: namedescription[index],

                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 2,
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
                                          hintText: "Long description",
                                          hintStyle: TextStyle(
                                              fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      child:Text("Qty ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                                    Container(
                                      height: 45,
                                      width: 180,
                                      child: TextField(
                                        controller: qty[index],

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
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                            hintText: "Unit",
                                            hintStyle: TextStyle(
                                                fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      child:Text("Tax ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                                    Container(
                                      height: 45,
                                      width: 180,
                                      child: TextField(
                                        controller: tax[index],

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
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                            hintText: "Tax",
                                            suffixIcon: Icon(Icons.percent_outlined),
                                            hintStyle: TextStyle(
                                                fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      child:Text("Rate ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                                    Container(
                                      height: 45,
                                      width: 180,
                                      child: TextField(
                                        controller: rate[index],

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
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                            hintText: "Rate",
                                            suffixIcon: Icon(Icons.percent_outlined),
                                            hintStyle: TextStyle(
                                                fontFamily: primaryFont, color: Colors.grey, fontSize: 14)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                      child:Text("Amount ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                                    Container(
                                      height: 45,
                                      width: 180,
                                      child: TextField(
                                        controller: amount[index],

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
                                            borderRadius: BorderRadius.circular(6),

                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                          hintText: "Amount",
                                          hintStyle: TextStyle(
                                              fontFamily: primaryFont, color: Colors.grey, fontSize: 14),
                                          suffixIcon: Icon(Icons.currency_rupee),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 10,),

                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      itemQty--;
                                      item.removeAt(index);
                                      namedescription.removeAt(index);
                                      qty.removeAt(index);
                                      tax.removeAt(index);
                                      rate.removeAt(index);
                                      amount.removeAt(index);

                                    });
                                  },
                                  child: Icon(Icons.cancel,size: 35,color: Colors.red,)),

                            ]
                        ))
                );
              },),
            /*  Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                          child:Text("Amount ",style: TextStyle(fontSize: 12,color: Colors.grey),),),


                        Container(
                          height: 45,
                          child: TextField(
                            controller: amount,

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
                                borderRadius: BorderRadius.circular(6),

                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              hintText: "Amount",
                              hintStyle: TextStyle(
                                  fontFamily: primaryFont, color: Colors.grey, fontSize: 14),
                              suffixIcon: Icon(Icons.currency_rupee),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0 ,horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.cancel,size: 30,color: Colors.red,),
                          Icon(Icons.cancel,size: 30,color: Colors.red,),
                        ],
                      ),),
                  ),

                ],
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Sub Total :",style: TextStyle(fontSize: 20),),
                  SizedBox(width: 25,),
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                        children: [
                          Icon(Icons.currency_rupee),]),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 160,
                    height: 40,
                    child: TextField(
                      controller: discount,

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
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                        hintText: "Discount",
                        hintStyle: TextStyle(
                            fontFamily: primaryFont, color: Colors.grey, fontSize: 14),
                        suffixIcon: Icon(Icons.percent_outlined),

                      ),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                        children: [
                          Icon(Icons.currency_rupee),]),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 160,
                    height: 40,
                    child: TextField(
                      controller: adjustment,


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
                          contentPadding: const EdgeInsets.only(left: 15,bottom: 8,right:15),
                          hintText: "Adjustment",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont, color: Colors.grey, fontSize: 14)

                      ),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                        children: [
                          Icon(Icons.currency_rupee),]),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Total :",style: TextStyle(fontSize: 20),),
                  SizedBox(width: 25,),
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                      children: [
                        Icon(Icons.currency_rupee),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: (){

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