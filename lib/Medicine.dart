import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'Model/MedicineModel.dart';

class Medicine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MedicineState();
  }
}

class _MedicineState extends State<Medicine> {
  //static int length = 11;
  //List<bool> isChecked = List<bool>.generate(length, (index) => false);
  List<MedicineModel> Medicines = [];
  List<MedicineModel> filteredMedicines = [];



  /*CountItemsChecked() {
    int _checkedBox = 0;
    for (int i = 0; i < isChecked.length; i++) if (isChecked[i]) _checkedBox++;
    return _checkedBox;
  }*/


  CountItemsChecked1() {
    int _checkedBox = 0;
    for (int i = 0; i < Medicines.length; i++)
      if (Medicines[i].isChecked)
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
    Medicines.add(MedicineModel.withName("Abacavir"));
    Medicines.add(MedicineModel.withName("Abacavir/Lamivudine(Epzicom)"));
    Medicines.add(MedicineModel.withName("Acyclovir"));
    Medicines.add(MedicineModel.withName("Alemtuzumab"));
    Medicines.add(MedicineModel.withName("Alendronate"));
    Medicines.add(MedicineModel.withName("Allopurinol"));
    Medicines.add(MedicineModel.withName("Amifostine"));
    Medicines.add(MedicineModel.withName("Aminocaproic Acid"));
    Medicines.add(MedicineModel.withName("Amitriptyline"));

    filteredMedicines.clear();
    filteredMedicines = Medicines;
  }

  _buildListItem(MedicineModel item, BuildContext context){
    return CheckboxListTile(
      title: Text(item.name),
      selected: item.isChecked,
      value: item.isChecked,
      onChanged: (bool? value) {
        int index = Medicines.indexOf(item);
        setState(() {
          item.isChecked = value!;
          Medicines[index].isChecked = value;
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
                  " Medicine ",
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
                                        filteredMedicines = Medicines;
                                      });
                                    }else{
                                      print(value);
                                      List<MedicineModel> list = [];
                                      for(var item in Medicines){
                                        if(item.name.toLowerCase().contains(value.toLowerCase())){
                                          list.add(item);
                                        }
                                      }
                                      setState(() {
                                        filteredMedicines = list;
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
                            return _buildListItem(filteredMedicines[index], context);
                          },
                          itemCount: filteredMedicines.length,
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
