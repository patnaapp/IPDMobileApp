import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:ipd_mobile/Model/RadiologyModel.dart';

class Radiology extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadiologyState();
  }
}

class _RadiologyState extends State<Radiology> {
  static int length = 11;
  //List<bool> isChecked = List<bool>.generate(length, (index) => false);
  List<RadiologyModel> radiologies = [];
  List<RadiologyModel> filteredRadiologies = [];



  /*CountItemsChecked() {
    int _checkedBox = 0;
    for (int i = 0; i < isChecked.length; i++) if (isChecked[i]) _checkedBox++;
    return _checkedBox;
  }*/


  CountItemsChecked1() {
    int _checkedBox = 0;
    for (int i = 0; i < radiologies.length; i++)
      if (radiologies[i].isChecked)
        _checkedBox++;
    return _checkedBox;
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    var count = CountItemsChecked1();
    //print(count);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Color(0xff00769D),
        content: Text('${count} Test Selected'),
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'Done',
            onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radiologies.add(RadiologyModel.withName("Computed Tomography"));
    radiologies.add(RadiologyModel.withName("Fluoroscopy"));
    radiologies.add(RadiologyModel.withName("Mammography"));
    radiologies.add(RadiologyModel.withName("Magnetic Resonance"));
    radiologies.add(RadiologyModel.withName("Nuclear Medicine"));
    radiologies.add(RadiologyModel.withName("Plain X-Ray"));
    radiologies.add(RadiologyModel.withName("Positron Emission Tomography"));

    filteredRadiologies.clear();
    filteredRadiologies = radiologies;
  }

  _buildListItem(RadiologyModel item, BuildContext context){
    return CheckboxListTile(
      title: Text(item.name),
      selected: item.isChecked,
      value: item.isChecked,
      onChanged: (bool? value) {
        int index = radiologies.indexOf(item);
        setState(() {
          item.isChecked = value!;
          radiologies[index].isChecked = value;
          /*if (value == true) {
            isChecked[0] = true;
          } else {
            isChecked[0] = false;
          }*/
          //print(isChecked);
          _showToast(context);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeaf1f9),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Header Container
              Container(
                padding: const EdgeInsets.fromLTRB(35, 20, 20, 10),
                //color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image.asset(
                        'Images/arrow.png',
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                //color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Text(
                  " Radiology ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  //physics: NeverScrollableScrollPhysics(),
                  physics: ScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Color(0xffeaf1f9),
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(fontSize: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(16),
                                      //fillColor: colorSearchBg,
                                    ),
                                    onChanged: (value){
                                      if(value.isEmpty || value == null){
                                        setState(() {
                                          filteredRadiologies = radiologies;
                                        });
                                      }else{
                                        print(value);
                                        List<RadiologyModel> list = [];
                                        for(var item in radiologies){
                                          if(item.name.toLowerCase().contains(value.toLowerCase())){
                                            list.add(item);
                                          }
                                        }
                                        setState(() {
                                          filteredRadiologies = list;
                                        });
                                      }

                                    },),
                              ),
                              SizedBox(width: 20.0, height: 30.0),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding:
                                  const EdgeInsets.fromLTRB(5, 14, 5, 13),
                                  //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xffeaf1f9),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset('Images/filter.png',
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index){
                            return _buildListItem(filteredRadiologies[index], context);
                          },
                          itemCount: filteredRadiologies.length,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
