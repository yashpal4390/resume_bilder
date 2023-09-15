// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';


import '../constant.dart';
import '../util.dart';

class PersionalDetail extends StatefulWidget {
  // const PersionalDetail({super.key});
  const PersionalDetail({Key? key}) : super(key: key);

  @override
  State<PersionalDetail> createState() => _PersionalDetailState();
}

class _PersionalDetailState extends State<PersionalDetail> {
  MaritalStatus? selectedMaritalStatus;
  bool? en = false;
  bool? hi = false;
  bool? gu = false;
  bool swtich = false;

  TextEditingController DOBController = TextEditingController();
  TextEditingController NationalityController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 160,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Text(
                      'Persional Details',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 5),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context, 'Hello from Second Screen!');
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 0.5)]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "DOB",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: DOBController,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter DOB";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'DD/MM/YYYY',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text("Marital Status",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Radio(
                          value: MaritalStatus.single,
                          groupValue: selectedMaritalStatus,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            selectedMaritalStatus = value;
                            setState(() {});
                            print("value $value");
                          },
                        ),
                        InkWell(
                          onTap: () {
                            selectedMaritalStatus = MaritalStatus.single;
                            setState(() {});
                          },
                          child: Text("Single"),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: MaritalStatus.married,
                          groupValue: selectedMaritalStatus,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            selectedMaritalStatus = value;
                            setState(() {});
                            print("value $value");
                          },
                        ),
                        InkWell(
                          onTap: () {
                            selectedMaritalStatus = MaritalStatus.married;
                            setState(() {});
                          },
                          child: Text("Married"),
                        )
                      ],
                    ),
                    Text("Language Known",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Checkbox(
                          value: en,
                          onChanged: (value) {
                            en = value;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // en=en!?false:true;
                            en = !en!;
                            setState(() {});
                          },
                          child: Text("English"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: hi,
                          onChanged: (value) {
                            hi = value;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // en=en!?false:true;
                            hi = !hi!;
                            setState(() {});
                          },
                          child: Text("Hindi"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: gu,
                          onChanged: (value) {
                            gu = value;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // en=en!?false:true;
                            gu = !gu!;
                            setState(() {});
                          },
                          child: Text("Gujrati"),
                        ),
                      ],
                    ),
                    Text("Nationality",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: NationalityController,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Nationality";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Indian',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            resume.en=en;
                            resume.hi=hi;
                            resume.gu=gu;
                            resume.DOB = DOBController.text;
                            resume.Nationality = NationalityController.text;
                            resume.Maritual_status = selectedMaritalStatus as String?;
                            Navigator.pushNamed(context, education, arguments: resume);
                          } // Navigator.pushNamed(context, education);
                        },
                        child: Text("Save")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum MaritalStatus { single, married }
