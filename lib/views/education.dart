import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

TextEditingController courseController = TextEditingController();
TextEditingController schoolController = TextEditingController();
TextEditingController prController = TextEditingController();
TextEditingController yearofpassController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white70,
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
                    'Education',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:70,left: 5),
                  child: InkWell(
                      onTap:(){ Navigator.pop(context, 'Hello from Second Screen!');},
                      child: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.white,)),
                )
              ],
            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cource/Degree',style: TextStyle(
                      fontSize: 18,color: Colors.blue
                  ),),
                  TextFormField(
                    controller: courseController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Course";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'B.Tech Information Technology',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('School/College/Institute',style: TextStyle(
                      fontSize: 18,color: Colors.blue
                  ),),
                  TextFormField(
                    controller: schoolController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter School";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Saurashtra University',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('School/College/Institute',style: TextStyle(
                      fontSize: 18,color: Colors.blue
                  ),),
                  TextFormField(
                    controller: prController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Percentage";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '70% (or) 7.0 CGPA',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('Year Of Pass',style: TextStyle(
                      fontSize: 18,color: Colors.blue
                  ),),
                  TextFormField(
                    controller: yearofpassController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Year of Pass";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '2003',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),

                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          resume.Course = courseController.text;
                          resume.School = schoolController.text;
                          resume.pr = prController.text;
                          resume.Year_of_pass = yearofpassController.text;
                          Navigator.pushNamed(
                              context, experiences, arguments: resume);
                        }// Navigator.pushNamed(context, experiences);
                      },
                      child: Text("Save")),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
