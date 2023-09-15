import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _EducationState();
}
TextEditingController HobbyController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _EducationState extends State<Hobbies> {
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
                    'Interest/Hobbies',
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
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hobbies',style: TextStyle(
                      fontSize: 18,color: Colors.blue
                  ),),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: HobbyController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Hobbiles&Interest";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Hobbies & Interest',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            resume.hobby = HobbyController.text;
                            Navigator.pushNamed(
                                context, archivment, arguments: resume);
                          }// Navigator.pushNamed(context, archivment);
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
