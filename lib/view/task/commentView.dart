import 'package:flutter/material.dart';

import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
            },
        icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: const Text("Comments",style: TextStyle(color: Colors.white,letterSpacing: 1),),
      ),

      body: Column(
        children: [
          SizedBox(height: 10,),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
            ),

            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: primary),
                              ),

                              SizedBox(height: 2,),
                              Text(
                                "Description",
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
                          child: SizedBox())
                    ],


                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("12 Oct 23",style: TextStyle(color: Colors.black.withOpacity(0.6),
                        fontFamily: primaryFont,fontWeight: FontWeight.w500,
                        fontSize: 12)),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: primary.withOpacity(0.3)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.zero,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  autofocus: true,
                  // controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',

                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){},
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
