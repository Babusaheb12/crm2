import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppRoute.dart';
import 'package:flutter/material.dart';

class ManageCustomer extends StatefulWidget {
  const ManageCustomer({Key? key}) : super(key: key);

  @override
  State<ManageCustomer> createState() => _ManageCustomerState();
}

class _ManageCustomerState extends State<ManageCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Customer",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(child: getCustomerData())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        shape: const RoundedRectangleBorder( // <= Change BeveledRectangleBorder to RoundedRectangularBorder
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        onPressed: (){
          NavigationService.instance.navigateTo("/addCustomer");
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Widget getCustomerData()
  {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 60),
      itemBuilder: (context, index) {
      return SizedBox(
        height: 100,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
          ),

          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: CircleAvatar(radius: 38,
                    child: Image.asset("images/lead.png",height: 35,),
                    )),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Customer Name",
                          style: TextStyle(
                              fontSize: 16,
                              color: primary),
                        ),

                        SizedBox(height: 2,),
                        Text(
                          "Customer Number",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(

                              fontSize: 14,
                              color: primary),
                        ),



                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius:15,
                            backgroundColor: primary,
                            child: Icon(Icons.edit,color: Colors.white,size: 15,),
                          ),
                          SizedBox(width: 6,),
                          CircleAvatar(
                            radius:15,
                            backgroundColor: Color(0xffce0e0e),
                            child: Icon(Icons.delete,color: Colors.white,size: 15,),
                          )

                        ],
                      ),
                    ))
              ],
            ),
          ),

          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                getRowContainer("Company","Testing"),
                SizedBox(height: 4,),

                getRowContainer("Phone","Testing"),
              ],
            ),
          ),*/
        ),
      );
    },);
  }

  Widget getRowContainer(String title,String value)
  {
    return Row(
      children: [
        Expanded(
          flex:10,
          child: Text(
            title,
            style: TextStyle(

                fontSize: 16,
                color: Colors.grey),
          ),
        ),
        Expanded(
          flex:1,
          child: Text(
            ":",
            style: TextStyle(

                fontSize: 13,color: Colors.grey),
          ),
        ),
        Expanded(
          flex:17,
          child: Text(
            value,
            style: TextStyle(

                fontSize: 16,
                color: primary),
          ),
        ),
      ],
    );
  }
}
