// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';

class carrier_objective extends StatefulWidget {
  // const carrier_objective({super.key});
  const carrier_objective({Key? key}) : super(key: key);

  @override
  State<carrier_objective> createState() => _carrier_objectiveState();
}

class _carrier_objectiveState extends State<carrier_objective> {
  TextEditingController COController = TextEditingController();
  TextEditingController CDController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      'Carrier Objective',
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
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Career Objective',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 10, right: 10),
                      child: TextFormField(
                        controller: COController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter Objective";
                          } else {
                            return null;
                          }
                        },
                        maxLines: 8,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Current Designation (Experienced Candidate)',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 90, left: 10, right: 10),
                      child: TextFormField(
                        controller: CDController,
                        maxLines: 1,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter Current Designation";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Software Engineer',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      resume.Career_Objective = COController.text;
                      resume.Current_Designation = CDController.text;
                      Navigator.pushNamed(context, persional_detail,arguments: resume);
                      // Navigator.pushNamed(context, persional_detail);
                    }
                    else
                      {
                        print("Invalid");
                      }
                  },
                  child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
