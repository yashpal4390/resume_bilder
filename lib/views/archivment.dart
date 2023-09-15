// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';

class Archivment extends StatefulWidget {
  const Archivment({super.key});

  @override
  State<Archivment> createState() => _EducationState();
}
TextEditingController achivementController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _EducationState extends State<Archivment> {
  List<String> skillList = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 160,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text(
                    'Achivement',
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
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 0.5)]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text(
                    "Enter Achivement",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )),

                  for (int i = 0; i < skillList.length; i++)
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: achivementController,
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Achivements";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Exceeded sales 17% average',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (value) {
                              skillList[i] = value;
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              print("Delete ${skillList[i]}");
                              skillList.removeAt(i);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),

                  OutlinedButton(
                      onPressed: () {
                        print(skillList);
                        skillList.add("");

                        setState(() {});
                      },
                      child: Icon(Icons.add)),

                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            resume.achivements = achivementController.text;
                            // Navigator.pushNamed(context, pdfScreenRoute,arguments: resume);
                            Navigator.pushNamed(context, refrences);
                          }
                        },
                        child: Text("Save")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
