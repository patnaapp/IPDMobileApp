import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/scheduler.dart';

class LabTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LabTestState();
  }
}

class _LabTestState extends State<LabTest> {
  static int length = 11;
  List<bool> isChecked = List<bool>.generate(length, (index) => false);
  bool blood_Count = false;
  bool serological_Test = false;
  bool immunologic = false;
  bool hematocrit = false;
  bool glucose_tolerance = false;
  bool epinephrine = false;
  bool enzyme_analysis = false;
  bool cephalin = false;
  bool bone_marrow = false;
  bool blood_Typing = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeaf1f9),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Header Container
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
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
                padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                //color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Text(
                  " Lab Test ",
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
                                        return 'Enter type of Lab Test';
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
                          title: const Text('Blood Count'),
                          selected: blood_Count,
                          value: blood_Count,
                          onChanged: (bool? value) {
                            setState(() {
                              blood_Count = value!;
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
                          title: const Text('Blood Typing'),
                          selected: blood_Typing,
                          value: blood_Typing,
                          onChanged: (bool? value) {
                            setState(() {
                              blood_Typing = value!;
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
                          title: const Text('Bone Marrow Aspiration'),
                          selected: bone_marrow,
                          value: bone_marrow,
                          onChanged: (bool? value) {
                            setState(() {
                              bone_marrow = value!;
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
                          title:
                              const Text('Cephalin-Cholesterol Flocculation'),
                          selected: cephalin,
                          value: cephalin,
                          onChanged: (bool? value) {
                            setState(() {
                              cephalin = value!;
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
                          title: const Text('Enzyme Analysis'),
                          selected: enzyme_analysis,
                          value: enzyme_analysis,
                          onChanged: (bool? value) {
                            setState(() {
                              enzyme_analysis = value!;
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
                          title: const Text('Epinephrine Tolerance Test'),
                          selected: epinephrine,
                          value: epinephrine,
                          onChanged: (bool? value) {
                            setState(() {
                              epinephrine = value!;
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
                          title: const Text('Glucose Tolerance Test'),
                          selected: glucose_tolerance,
                          value: glucose_tolerance,
                          onChanged: (bool? value) {
                            setState(() {
                              glucose_tolerance = value!;
                              if (value == true) {
                                isChecked[6] = true;
                              } else {
                                isChecked[6] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Hematocrit'),
                          selected: hematocrit,
                          value: hematocrit,
                          onChanged: (bool? value) {
                            setState(() {
                              hematocrit = value!;
                              if (value == true) {
                                isChecked[7] = true;
                              } else {
                                isChecked[7] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Immunologic Blood Test'),
                          selected: immunologic,
                          value: immunologic,
                          onChanged: (bool? value) {
                            setState(() {
                              immunologic = value!;
                              if (value == true) {
                                isChecked[8] = true;
                              } else {
                                isChecked[8] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),
                        Container(
                            child: CheckboxListTile(
                          title: const Text('Serological Test'),
                          selected: serological_Test,
                          value: serological_Test,
                          onChanged: (bool? value) {
                            setState(() {
                              serological_Test = value!;
                              if (value == true) {
                                isChecked[9] = true;
                              } else {
                                isChecked[9] = false;
                              }
                              _showToast(context);
                            });
                          },
                        )),

                        /*Container(
                        color: Colors.white,
                        height: 600.0,
                        alignment: Alignment.center,
                        child: Image.asset('Images/newlogo.jpg'),
                      ),*/

                        //TextField nearly at bottom
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
