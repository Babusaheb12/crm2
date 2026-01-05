import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppFont.dart';
import 'package:flutter/material.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {

  TextEditingController memberName = TextEditingController();
  FocusNode memberNameNode = FocusNode();

  TextEditingController phoneNoCt = TextEditingController();
  FocusNode phoneNoCtNode = FocusNode();

  TextEditingController vatNumberCt = TextEditingController();
  FocusNode vatNumberCtNode = FocusNode();

  TextEditingController latitudeCt = TextEditingController();
  FocusNode latitudeCtNode = FocusNode();

  TextEditingController longitudeCt = TextEditingController();
  FocusNode longitudeCtNode = FocusNode();

  TextEditingController addressCt = TextEditingController();
  FocusNode addressCtNode = FocusNode();

  TextEditingController cityCt = TextEditingController();
  FocusNode cityCtNode = FocusNode();

  TextEditingController stateCt = TextEditingController();
  FocusNode stateCtNode = FocusNode();
  TextEditingController websiteCt = TextEditingController();
  FocusNode websiteCtNode = FocusNode();

  TextEditingController zipCodeCt = TextEditingController();
  FocusNode zipCodeCtNode = FocusNode();

  TextEditingController streetCtB = TextEditingController();
  FocusNode streetCtBNode = FocusNode();
  TextEditingController cityCtB = TextEditingController();
  FocusNode cityCtBNode = FocusNode();
  TextEditingController stateCtB = TextEditingController();
  FocusNode stateCtBNode = FocusNode();
  TextEditingController zipCodeCtB = TextEditingController();
  FocusNode zipCodeCtBNode = FocusNode();

  TextEditingController streetCtS = TextEditingController();
  FocusNode streetCtSNode = FocusNode();
  TextEditingController cityCtS = TextEditingController();
  FocusNode cityCtSNode = FocusNode();
  TextEditingController stateCtS = TextEditingController();
  FocusNode stateCtSNode = FocusNode();
  TextEditingController zipCodeCtS = TextEditingController();
  FocusNode zipCodeCtSNode = FocusNode();

  List<String>currencyList = ["System Currency","USD","EUR","INR"];

  String category = 'valid';

  List<String>languageList = ["System Language","Catalan","Chinese","Dutch","English","French","German","Indonesia","Italian",
    "Japanese","Persian","Polish","Portuguese","Russian","Spanish","Swedish","Turkish"];
  String selectLanguage = "System Language";
  String selectCurrency = "System Currency";
  String selectCountry = "System Country";
  String selectCountryB = "System Country";
  String selectCountryS = "System Country";
  String selectGroup = "Select Group";
  List<String> groupList = ["Select Group"];
  bool isVisible = true;
  bool isVisible2 = false;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Customer",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Customer Details",style: TextStyle(fontSize: 16,color: primary),),
                 isVisible  ?  InkWell(
                    onTap: (){
                      setState(() {
                        isVisible = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.expand_less_outlined,color: primary,),
                    ),
                  ):  InkWell(
                   onTap: (){
                     setState(() {
                       isVisible = true;
                     });
                   },
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: Icon(Icons.expand_more,color: Colors.grey,),
                   ),
                 )
                ],
              ),
            ),
            isVisible ? customerDetails() : SizedBox(),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Billing & Shipping",style: TextStyle(fontSize: 16,color: primary),),
                  isVisible2  ?  InkWell(
                    onTap: (){
                      setState(() {
                        isVisible2 = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.expand_less_outlined,color: primary,),
                    ),
                  ):  InkWell(
                    onTap: (){
                      setState(() {
                        isVisible2 = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.expand_more,color: Colors.grey,),
                    ),
                  )
                ],
              ),
            ),
            isVisible2 ? shippingAddress() : SizedBox(),

            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget customerDetails()
  {
    return Column(
      children:
      [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: memberName,
              focusNode: memberNameNode,
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
                  hintText: "Company Name",
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
              controller: addressCt,
              focusNode: addressCtNode,
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
              controller: phoneNoCt,
              focusNode: phoneNoCtNode,
              keyboardType: TextInputType.number,
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
                  hintText: "Phone no.",
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
              focusNode: cityCtNode,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: vatNumberCt,
              focusNode: vatNumberCtNode,
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
                  hintText: "VAT Number",
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
              controller: stateCt,
              focusNode: stateCtNode,
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
          padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
          child: Container(

            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: primary,width: 1)
            ),
            padding:const EdgeInsets.symmetric(horizontal: 10.0),

            child: DropdownButton(
              hint: Text("Currency",
                style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
              iconSize: 25,
              isExpanded: true,
              underline: SizedBox(),
              style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
              items: currencyList.map((String language) {
                return  DropdownMenuItem<String>(
                  child:  Text(language),
                  value: language,
                );
              }).toList(),
              value: selectCurrency,
              onChanged: (String? value) {

                setState(() {
                  selectCurrency = value.toString();
                });
              },),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: zipCodeCt,
              focusNode: zipCodeCtNode,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: latitudeCt,
              focusNode: latitudeCtNode,
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
                  hintText: "Latitude",
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
              focusNode: websiteCtNode,
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: longitudeCt,
              focusNode: longitudeCtNode,
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
                  hintText: "Longitude",
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
              hint: Text("Groups",
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
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: ()
            {
              if(category=="valid")
                {
                  category = "";
                }
              else
              {
                category = "valid";
              }
              setState(() {

              });
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF707070),width: 1)),
                  child: Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(4),

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: category == "valid"?
                        Colors.green : Colors.transparent
                    ),
                  ),
                ),
                SizedBox(width: 4,),
                Text(
                  "Show primary contact full name on Invoices, Estimates, Payments",
                  style: TextStyle(fontFamily: primaryFont, fontSize: 11),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40,),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.green),
              child: Text("Save",style: TextStyle(fontSize: 14,color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: primary),
              child: Text("Save and create contact",style: TextStyle(fontSize: 14,color: Colors.white),),
            )
          ],
        ),





      ],
    );
  }

  Widget shippingAddress()
  {
    return Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Billing Address",style: TextStyle(fontSize: 16,color: primary),),
              InkWell(
                onTap: (){
                  setState(() {
                    // isVisible = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:Text("Same as Customer Info",style: TextStyle(fontSize: 14,color: Colors.blue),),
                ),
              )
            ],
          ),
        ),

        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: streetCtB,
              focusNode: streetCtBNode,
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
                  hintText: "Street",
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
              controller: cityCtB,
              focusNode: cityCtBNode,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: stateCtB,
              focusNode: stateCtBNode,
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
              controller: zipCodeCtB,
              focusNode: zipCodeCtBNode,
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
              value: selectCountryB,
              onChanged: (String? value) {

                setState(() {
                  selectCountryB = value.toString();
                });
              },),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping Address",style: TextStyle(fontSize: 16,color: primary),),
             InkWell(
                onTap: (){
                  setState(() {
                    // isVisible = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:Text("Copy Billing Address",style: TextStyle(fontSize: 14,color: Colors.blue),),
                ),
              )
            ],
          ),
        ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: streetCtS,
              focusNode: streetCtSNode,
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
                  hintText: "Street",
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
              controller: cityCtS,
              focusNode: cityCtSNode,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: stateCtS,
              focusNode: stateCtSNode,
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
              controller: zipCodeCtS,
              focusNode: zipCodeCtSNode,
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
              value: selectCountryS,
              onChanged: (String? value) {

                setState(() {
                  selectCountryS = value.toString();
                });
              },),
          ),
        ),

        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.green),
              child: Text("Save",style: TextStyle(fontSize: 14,color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: primary),
              child: Text("Save and create contact",style: TextStyle(fontSize: 14,color: Colors.white),),
            )
          ],
        ),

      ],
    );
  }
}
