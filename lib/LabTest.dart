import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/scheduler.dart';
//import 'package:ipd_mobile/Model/RadiologyModel.dart';

import 'Model/LabTestModel.dart';

class LabTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LabTestState();
  }
}

class _LabTestState extends State<LabTest> {
  static int length = 11;
 // List<bool> isChecked = List<bool>.generate(length, (index) => false);
  //bool computed_tomography = false;
 // bool fluroscopy = false;
  //bool mammography = false;
 // bool magnetic_resonance = false;
  //bool nuclear_medicine = false;
  //bool plain_xray = false;
  //bool positron_emission = false;
  List<LabTestModel> labTest = [];
  List<LabTestModel> filteredLabTest = [];



  /*CountItemsChecked() {
    int _checkedBox = 0;
    for (int i = 0; i < isChecked.length; i++) if (isChecked[i]) _checkedBox++;
    return _checkedBox;
  }*/


  CountItemsChecked1() {
    int _checkedBox = 0;
    for (int i = 0; i < labTest.length; i++)
      if (labTest[i].isChecked)
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
    labTest.add(LabTestModel.withName("Blood Count"));
    labTest.add(LabTestModel.withName("Blood Typing"));
    labTest.add(LabTestModel.withName("Bone Marrow Aspiration"));
    labTest.add(LabTestModel.withName("Cephalin-Cholesterol Flocculation"));
    labTest.add(LabTestModel.withName("Enzyme Analysis"));
    labTest.add(LabTestModel.withName("Epinephrine Tolerance Test"));
    labTest.add(LabTestModel.withName("Glucose Tolerance Test"));
    labTest.add(LabTestModel.withName("Hematocrit"));
    labTest.add(LabTestModel.withName("Immunologic Blood Test"));
    labTest.add(LabTestModel.withName("Serological Test"));

    filteredLabTest.clear();
    filteredLabTest = labTest;
  }

  _buildListItem(LabTestModel item, BuildContext context){
    return CheckboxListTile(
      title: Text(item.name),
      selected: item.isChecked,
      value: item.isChecked,
      onChanged: (bool? value) {
        int index = labTest.indexOf(item);
        setState(() {
          item.isChecked = value!;
          labTest[index].isChecked = value;
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
                                    onChanged: (value){
                                      if(value.isEmpty || value == null){
                                        setState(() {
                                          filteredLabTest = labTest;
                                        });
                                      }else{
                                        print(value);
                                        List<LabTestModel> list = [];
                                        for(var item in labTest){
                                          if(item.name.toLowerCase().contains(value.toLowerCase())){
                                            list.add(item);
                                          }
                                        }
                                        setState(() {
                                          filteredLabTest = list;
                                        });
                                      }

                                    },
                                    ),
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
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index){
                            return _buildListItem(filteredLabTest[index], context);
                          },
                          itemCount: filteredLabTest.length,
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
