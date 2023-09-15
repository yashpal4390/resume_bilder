// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resume_bilder/views/techinical_skills.dart';

import '../constant.dart';
import '../util.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});


  @override
  State<Experiences> createState() => _EducationState();
}
TextEditingController companynameController = TextEditingController();
TextEditingController school1Controller = TextEditingController();
TextEditingController RolesController = TextEditingController();
TextEditingController joindateController = TextEditingController();
TextEditingController exitdateController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _EducationState extends State<Experiences> {
  Emp_Status? selectedEmp_Status;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white70,
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
                      'Experiences',
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
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company Name',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    TextFormField(
                      controller: companynameController,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Company Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'New Enterprise,San Francisco',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'School/College/Institute',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    TextFormField(
                      controller: school1Controller,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter School";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Quality Test Engineer',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Roles (optional)',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    TextFormField(
                      controller: RolesController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText:
                            'Working With Team Members To Come Up With New Concepts And Product Analysis...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Employed Status',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: Emp_Status.currently,
                              groupValue: selectedEmp_Status,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                selectedEmp_Status = value;
                                setState(() {});
                                print("value $value");
                              },
                            ),
                            InkWell(
                              onTap: () {
                                selectedEmp_Status = Emp_Status.currently;
                                setState(() {});
                              },
                              child: Text(
                                "Previously Employed",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              //value: swtich,
                              value: Emp_Status.previously,
                              groupValue: selectedEmp_Status,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                selectedEmp_Status = value;
                                setState(() {});
                                print("value $value");
                              },
                            ),
                            InkWell(
                              onTap: () {
                                selectedEmp_Status = Emp_Status.previously;
                                setState(() {});
                              },
                              child: Text(
                                "Currently Employed",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          'Date Joined',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                        SizedBox(
                          width: 125,
                        ),
                        Text(
                          'Date Exit',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextFormField(
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Joined Date";
                                } else {
                                  return null;
                                }
                              },
                            controller: joindateController,
                              decoration: InputDecoration(
                                  hintText: 'DD/MM/YYYY',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder())),
                        ),
                        SizedBox(width: 90),
                        Flexible(
                          child: TextFormField(
                            controller: exitdateController,
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Exited Date";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'DD/MM/YYYY',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10))),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              resume.Companyname = companynameController.text;
                              resume.school1 = school1Controller.text;
                              resume.Roles = RolesController.text;
                              resume.JoinDate = joindateController.text;
                              resume.ExitDate = exitdateController.text;
                              // resume.emp_status = selectedEmp_Status as String?;
                              Navigator.pushNamed(
                                  context, Techinical, arguments: resume);
                            }// Navigator.pushNamed(context, Techinical);
                          },
                          child: Text("Save")),
                    ),
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

enum Emp_Status { previously, currently }
