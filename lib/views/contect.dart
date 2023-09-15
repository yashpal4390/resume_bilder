// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constant.dart';
import '../util.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  bool isFirst = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = "";

  final ImagePicker picker = ImagePicker();

  // String? filePath;
  XFile? xFile;

  @override
  void initState() {
    // nameController.text="Ravi";
    // emailController.text="ravi007@gmail.com";
    // phoneController.text="9898989898";
    // addressController.text="150 ring";
    // address1Controller.text="raj";
    // address2Controller.text="ind";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resumes Workspace"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    isFirst = true;
                    setState(() {});
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Contact",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      if (isFirst)
                        Divider(
                          thickness: 3,
                          height: 3,
                          color: Colors.yellow,
                        )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    isFirst = false;
                    setState(() {});
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Photo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      if (!isFirst)
                        Divider(
                          thickness: 3,
                          height: 3,
                          color: Colors.yellow,
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: IndexedStack(
                index: isFirst ? 0 : 1,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(21),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    // initialValue: "",
                                    controller: nameController,
                                    onFieldSubmitted: (value) {
                                      print("onFieldSubmitted $value");
                                    },
                                    // controller: nameController,
                                    // onChanged: (value) {
                                    //   name = value;
                                    //   print(value);
                                    // },
                                    onSaved: (newValue) {
                                      print("On Save $newValue");
                                      name = newValue ?? "";
                                    },
                                    validator: (value) {
                                      if (value?.isEmpty ?? false) {
                                        return "Enter Your Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(hintText: "Name", hintStyle: TextStyle(color: Colors.grey)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value?.isEmpty ?? false) {
                                          return "Enter Email address";
                                        } else if (!value!.contains("@")) {
                                          return "Enter Valid Email address";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.phone_android, color: Colors.grey),
                                SizedBox(width: 15),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    onSaved: (newValue) {},
                                    validator: (value) {
                                      if (value?.isEmpty ?? false) {
                                        return "Enter Phone Number";
                                      } else if (int.tryParse(value ?? "") == null) {
                                        return "Enter Valid Phone Number";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Phone",
                                      // prefix: Icon(Icons.phone_android),
                                      // prefixIcon: Icon(Icons.phone_android),
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: addressController,
                                        keyboardType: TextInputType.streetAddress,
                                        validator: (value) {
                                          if (value?.isEmpty ?? false) {
                                            return "Enter Address";
                                          } else {
                                            return null;
                                          }
                                        },
                                        // obscureText: true,
                                        // obscuringCharacter: "-",
                                        decoration: InputDecoration(
                                          hintText: "Address",
                                          // prefix: Icon(Icons.phone_android),
                                          // prefixIcon: Icon(Icons.phone_android),
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: address1Controller,
                                        validator: (value) {
                                          if (value?.isEmpty ?? false) {
                                            return "Enter Address";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Address Line 1",
                                          // prefix: Icon(Icons.phone_android),
                                          // prefixIcon: Icon(Icons.phone_android),
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: address2Controller,
                                        validator: (value) {
                                          if (value?.isEmpty ?? false) {
                                            return "Enter Address";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Address Line 2",
                                          // prefix: Icon(Icons.phone_android),
                                          // prefixIcon: Icon(Icons.phone_android),
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState?.validate() ?? false) {
                                        FocusScope.of(context).unfocus(); // For keyboard Close
                                        formKey.currentState?.save();
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Save Successfully"),
                                          duration: Duration(seconds: 3),
                                          backgroundColor: Colors.red,
                                          action: SnackBarAction(
                                            label: "Send",
                                            onPressed: () {},
                                          ),
                                        ));
                                        resume.name=nameController.text;
                                        resume.email=emailController.text;
                                        resume.phone=phoneController.text;
                                        resume.address1=addressController.text;
                                        resume.address2=address1Controller.text;
                                        resume.address3=address2Controller.text;

                                        Navigator.pushNamed(context, carrierobjective,arguments: resume);
                                        // Navigator.pushNamed(context, carrierobjective);

                                        print("Save $name");
                                      } else {
                                        print("Invalid");
                                      }
                                    },
                                    child: Text("Save")),
                                SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      print("Reset");
                                      // nameController.clear();
                                      // emailController.clear();
                                      // phoneController.text = "";
                                      // addressController.text = "";
                                      // address1Controller.text = "";
                                      // address2Controller.text = "";

                                      formKey.currentState?.reset();
                                      FocusScope.of(context).unfocus(); // For keyboard Close
                                    },
                                    child: Text("Reset")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 50),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    child: Stack(
                      fit: StackFit.passthrough,
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          backgroundImage: xFile != null
                              ? FileImage(
                            File(xFile?.path ?? ""),
                          )
                              : null,
                          child: Text("Add"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 80,
                          child: IconButton(
                              onPressed: () async {
                                // XFile? file = await picker.pickImage(source: ImageSource.gallery);
                                xFile = await picker.pickImage(source: ImageSource.camera);

                                setState(() {});
                              },
                              icon: Icon(Icons.camera_alt_rounded)),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 120,
                          child: IconButton(
                              onPressed: () {
                                picker.pickImage(source: ImageSource.gallery).then((value) {
                                  xFile = value;
                                  setState(() {});
                                });
                              },
                              icon: Icon(Icons.photo)),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}