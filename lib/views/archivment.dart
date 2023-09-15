import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';

class Archivment extends StatefulWidget {
  const Archivment({super.key});

  @override
  State<Archivment> createState() => _EducationState();
}
TextEditingController achivementController = TextEditingController();
class _EducationState extends State<Archivment> {
  List<String> skillList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // ...skillList
                //     .map((e) => Row(
                //           children: [
                //             Expanded(child: TextFormField(
                //               onChanged: (value) {
                //                 e = value;
                //               },
                //             )),
                //             IconButton(
                //                 onPressed: () {
                //                   print("Delete $e");
                //                 },
                //                 icon: Icon(Icons.delete))
                //           ],
                //         ))
                //     .toList(),
                for (int i = 0; i < skillList.length; i++)
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: achivementController,
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
                        resume.achivements=achivementController.text;
                        // Navigator.pushNamed(context, pdfScreenRoute,arguments: resume);
                        Navigator.pushNamed(context, refrences);
                      },
                      child: Text("Save")),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
