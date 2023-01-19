import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onsave,
    required this.oncancel,
  });

  //TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 100,
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Container(
            // height: 306,
            // width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),



                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.task, color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Task",
                  ),
                ),


    //            SizedBox(height: 10),


                // Column(
                //   children: <Widget>[
                //     Card(
                //
                //         color: Colors.white60,
                //         child: Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: TextField(
                //             maxLines: 4, //or null
                //             decoration: InputDecoration.collapsed(
                //                 hintText: "Enter the Discription"),
                //           ),
                //         ))
                //   ],
                // ),


         //       SizedBox(height: 10),


                // TextField(
                //   controller: dateinput,
                //   //editing controller of this TextField
                //   decoration: InputDecoration(
                //     prefixIcon:
                //         Icon(Icons.calendar_month_rounded, color: Colors.blue),
                //     border: OutlineInputBorder(), //icon of text field
                //     labelText: "Due Date",
                //   ),
                //   readOnly: false,
                //   //set it true, so that user will not able to edit text
                //   onTap: () async {
                //     DateTime? pickedDate = await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2000),
                //         //DateTime.now() - not to allow to choose before today.
                //         lastDate: DateTime(2101));
                //
                //     if (pickedDate != null) {
                //       print(pickedDate);
                //       String formattedDate =
                //           DateFormat('dd-MM-yyyy').format(pickedDate);
                //       print(
                //           formattedDate); //formatted date output using intl package =>  2021-03-16
                //       //you can implement different kind of Date Format here according to your requirement
                //
                //       dateinput.text =
                //           formattedDate; //set output date to TextField value.
                //
                //     } else {
                //       print(" Date is not selected");
                //     }
                //   },
                // ),


         //       SizedBox(height: 10),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyaddButton(
                      text: "Cancel",
                      onPressed: oncancel,
                    ),
                    MyaddButton(
                      text: "Save",
                      onPressed: onsave,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
