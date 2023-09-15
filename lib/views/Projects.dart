import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _EducationState();
}
TextEditingController projecttitleController = TextEditingController();
TextEditingController Roles1Controller = TextEditingController();
TextEditingController TechnoController = TextEditingController();
TextEditingController projectdescription = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _EducationState extends State<Projects> {
  bool? c = false;
  bool? cpp = false;
  bool? fu = false;
  bool swtich = false;

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
                      'Projects',
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
                    Text('Project Title',style: TextStyle(
                        fontSize: 18,color: Colors.blue
                    ),),
                    TextFormField(
                      controller: projecttitleController,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Project Title";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Resume Builder App',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('Technologies',style: TextStyle(
                        fontSize: 18,color: Colors.blue
                    ),),

                    Row(
                      children: [
                        Checkbox(
                          value: c,
                          onChanged: (value) {
                            c = value;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // en=en!?false:true;
                            c= !c!;
                            setState(() {});
                          },
                          child: Text("C Programming"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: cpp,
                          onChanged: (value) {
                            cpp = value;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // en=en!?false:true;
                            cpp = !cpp!;
                            setState(() {});
                          },
                          child: Text("C++"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: fu,
                          onChanged: (value) {
                            fu = value;
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // en=en!?false:true;
                            fu = !fu!;
                            setState(() {});
                          },
                          child: Text("Flutter"),
                        ),
                      ],
                    ),

                    Text('Roles',style: TextStyle(
                        fontSize: 18,color: Colors.blue
                    ),),
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Roles";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Organize Team Members,Code Analysis',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('Technologies',style: TextStyle(
                        fontSize: 18,color: Colors.blue
                    ),),
                    TextFormField(
                      controller: TechnoController,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Technologies";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '5 - Programmers',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('Project Description',style: TextStyle(
                        fontSize: 18,color: Colors.blue
                    ),),
                    TextFormField(
                      controller: projectdescription,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Project Description";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Project Description',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),

                    SizedBox(height: 15),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              resume.Project_title = projecttitleController.text;
                              resume.Roles1 = Roles1Controller.text;
                              resume.techno = TechnoController.text;
                              resume.project_des = projectdescription.text;
                              // Navigator.pushNamed(context, pdfScreenRoute,arguments: resume);
                              Navigator.pushNamed(context, archivment);
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
      ),
    );
  }
}