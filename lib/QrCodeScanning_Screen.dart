


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipd_mobile/Constants/AppConstants.dart';


class QrCodeScanning_Screen extends StatefulWidget
{
  QrCodeScanning_Screen();

  @override
  _State createState() => _State();
}

class _State extends State<QrCodeScanning_Screen> {
  String _relationtype_value = "0";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Stack(
            children: <Widget>[
              // The containers in the background
              new Column(
                children: <Widget>[
                  new Container(

                    height: MediaQuery.of(context).size.height * .55,
                    color: kQrBackgroundColour,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 15),
                        Center(child: Image.asset("images/e_hospital_icon.png", width: 140.0, height: 60.0, fit: BoxFit.cover)),
                        SizedBox(height: 8),
                        Align(alignment: Alignment.center,child: Text('Scan QR Code', style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold))),
                        SizedBox(height: 8),
                        Center(child: Image.asset("images/qr_icon.png", width: 200.0, height: 200.0, fit: BoxFit.cover)),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(alignment: Alignment.centerLeft,child: Text('Or Search by:', style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold))),
                        ),


                      ],
                    ),
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.height * .45,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),

                    ),

                    ),
                  )
                ],
              ),
              // The card widget with top padding,
              // incase if you wanted bottom padding to work,
              // set the `alignment` of container to Alignment.bottomCenter
              new Container(
                alignment: Alignment.topCenter,
                padding: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .48,
                    right: 20.0,
                    left: 20.0),
                child: new Container(
                  height: 140.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 6.0,

                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: DropdownButtonFormField(
                              isExpanded: true,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(2.5),
                                  ),
                                ),
                                filled: true,
                                hintStyle:
                                TextStyle(color: Colors.grey[800]),
                                hintText: "Select Ward",
                                fillColor:
                                Color.fromARGB(255, 238, 241, 241),
                                contentPadding: EdgeInsets.all(12),
                              ),
                              validator: (value) {
                                if (value == "0") {
                                  return 'Please select ward';
                                }
                                return null;
                              },
                              value:_relationtype_value,
                              items: [
                                DropdownMenuItem<String>(
                                  child: Text("Select Ward",
                                      overflow: TextOverflow.ellipsis),
                                  value: "0",
                                ),
                                DropdownMenuItem<String>(
                                    child: Text(
                                        "1",
                                        overflow:
                                        TextOverflow.ellipsis),
                                    value: "6"),
                                DropdownMenuItem<String>(
                                  child: Text("2",
                                      overflow: TextOverflow.ellipsis),
                                  value: "1",
                                ),
                                DropdownMenuItem<String>(
                                    child: Text(
                                        "3",
                                        overflow:
                                        TextOverflow.ellipsis),
                                    value: "2"),
                                DropdownMenuItem<String>(
                                    child: Text(
                                        "4",
                                        overflow:
                                        TextOverflow.ellipsis),
                                    value: "3"),
                                DropdownMenuItem<String>(
                                    child: Text(
                                        "5",
                                        overflow:
                                        TextOverflow.ellipsis),
                                    value: "4"),


                              ],
                              onChanged: (value) {
                                setState(() {

                                });
                              }),

                        ),
                        Row(
                          children: [
                             Flexible(
                               child: Container(
                                  height: 45,
                                  margin: const EdgeInsets.only(top: 2.0,left: 12,right: 12),
                                  child:   TextFormField(
                                    keyboardType: TextInputType.text,

                                    style: style,
                                    decoration: InputDecoration(fillColor: kPrimaryColour, filled: true,
                                        suffixIcon: FlatButton(padding: EdgeInsets.all(8),
                                          child: Text('SEARCH', style: TextStyle(fontSize: 14.0,color: Colors.white),),
                                          color: kButtonPrimaryColour,
                                          shape: Border.all(color: kButtonPrimaryColour,width: 15,),
                                          onPressed: () {},
                                        ),
                                        hintText: "Enter UHID",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none,)),
                                    validator: (value) {
                                      if (value == null || value.length==0) {
                                        return 'required';
                                      }
                                      return null;
                                    },

                                  )

                            ),

                             ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:kButtonPrimaryColour,
                                  boxShadow: [
                                    BoxShadow(color:kButtonPrimaryColour, spreadRadius: 3),
                                  ],),
                              margin: EdgeInsets.only(left:2,right: 12),
                                height:40,
                                width: 40,child: Icon(
                              Icons.filter_list_alt, size: 30.0,
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  @override
  void dispose() {
    print("Disposing second route");

    super.dispose();
  }


}
