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
  List<bool> isChecked = List<bool>.generate(length, (index) => false);
  bool computed_tomography = false;
  bool fluroscopy = false;
  bool mammography = false;
  bool magnetic_resonance = false;
  bool nuclear_medicine = false;
  bool plain_xray = false;
  bool positron_emission = false;
  List<RadiologyModel> radiologies = [];
  List<RadiologyModel> filteredRadiologies = [];



  CountItemsChecked() {
    int _checkedBox = 0;
    for (int i = 0; i < isChecked.length; i++) if (isChecked[i]) _checkedBox++;
    return _checkedBox;
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    var count = CountItemsChecked();
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
        setState(() {
          item.isChecked = value!;
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter type of radiology.';
                                      }
                                      return null;
                                    }),
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

                        Container(
                            child: CheckboxListTile(
                          title: const Text('Computed Tomography'),
                          selected: computed_tomography,
                          value: computed_tomography,
                          onChanged: (bool? value) {
                            setState(() {
                              computed_tomography = value!;
                              if (value == true) {
                                isChecked[0] = true;
                              } else {
                                isChecked[0] = false;
                              }
                              //print(isChecked);
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Fluoroscopy'),
                          selected: fluroscopy,
                          value: fluroscopy,
                          onChanged: (bool? value) {
                            setState(() {
                              fluroscopy = value!;
                              if (value == true) {
                                isChecked[1] = true;
                              } else {
                                isChecked[1] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Mammography'),
                          selected: mammography,
                          value: mammography,
                          onChanged: (bool? value) {
                            setState(() {
                              mammography = value!;
                              if (value == true) {
                                isChecked[2] = true;
                              } else {
                                isChecked[2] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Magnetic Resonance'),
                          selected: magnetic_resonance,
                          value: magnetic_resonance,
                          onChanged: (bool? value) {
                            setState(() {
                              magnetic_resonance = value!;
                              if (value == true) {
                                isChecked[3] = true;
                              } else {
                                isChecked[3] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Nuclear Medicine'),
                          selected: nuclear_medicine,
                          value: nuclear_medicine,
                          onChanged: (bool? value) {
                            setState(() {
                              nuclear_medicine = value!;
                              if (value == true) {
                                isChecked[4] = true;
                              } else {
                                isChecked[4] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Plain X-Ray'),
                          selected: plain_xray,
                          value: plain_xray,
                          onChanged: (bool? value) {
                            setState(() {
                              plain_xray = value!;
                              if (value == true) {
                                isChecked[5] = true;
                              } else {
                                isChecked[5] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Positron Emission Tomography '),
                          selected: positron_emission,
                          value: positron_emission,
                          onChanged: (bool? value) {
                            setState(() {
                              positron_emission = value!;
                              if (value == true) {
                                isChecked[6] = true;
                              } else {
                                isChecked[6] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),

                        //TextField nearly at bottom
                      ],
                    ),
                  ),
                ),
              ),

              /*Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return _buildListItem(filteredRadiologies[index], context);
                  },
                  itemCount: filteredRadiologies.length,
                ),
              ),*/
            ],
          ),
        ));
  }
}
