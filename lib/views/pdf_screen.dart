import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_bilder/views/ruseme.dart';

import '../util.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({Key? key}) : super(key: key);

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  Resume? myResume;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    myResume = ModalRoute.of(context)?.settings.arguments as Resume?;
    myResume?.display();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDFScreen")),
      body: PdfPreview(
        build: (format) {
          return genPdf();
        },
      ),
    );
  }

  Future<Uint8List> genPdf() {
    pw.Document doc = pw.Document();

    doc.addPage(pw.Page(
      build: (context) {
        return pw.Stack(
          children: [
            pw.Container(
              padding: pw.EdgeInsets.only(top: 200, left: 70),
              width: double.infinity,
              height: double.infinity,
              color: PdfColors.grey100,
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "Technical Skills",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Skills??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "Interest/Hobbies",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.hobby??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "Projects",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Project_title??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.techno??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Roles1??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.project_des??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "Personal Details",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.DOB??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Maritual_status??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Nationality??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "Experience",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Companyname??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Roles??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "Joining Date:\n${myResume?.JoinDate ??""}\n\n"
                    "Exit Date:\n${myResume?.ExitDate ??""}",

                    style: pw.TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            pw.Container(
                margin: pw.EdgeInsets.only(top: 20),
                padding: pw.EdgeInsets.only(left: 80),
                width: double.infinity,
                height: 160,
                color: PdfColor.fromInt(0xffEBC9BB),
                child: pw.Column(children: [
                  pw.Text(
                    "${myResume?.name??""}",
                    style: pw.TextStyle(
                        fontSize: 30, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 12),
                  pw.Text(
                    "${myResume?.Career_Objective??""}",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Current_Designation??""}",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                ])),
            pw.Container(
              margin: pw.EdgeInsets.only(left: 20),
              width: 160,
              padding: pw.EdgeInsets.only(top: 200, left: 20),
              height: double.infinity,
              color: PdfColor.fromInt(0xff6B9999),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Declaration",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 12),
                  pw.Text(
                    "${myResume?.declaration??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                      "${myResume?.newjoindate??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.place??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "Achievements",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.achivements??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "Education",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Course??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.School??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.pr??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.Year_of_pass??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 30),
                  pw.Text(
                    "Contect Info",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.phone??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.email??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.address1??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.address2??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    "${myResume?.address3??""}",
                    style: pw.TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            pw.Container(
              margin: pw.EdgeInsets.only(top: 30, left: 30),
              width: 140,
              height: 140,
              decoration: (pw.BoxDecoration(
                  shape: pw.BoxShape.circle, color: PdfColors.green)),
              child: pw.Circle(strokeColor: PdfColors.cyan),
            ),
          ],
        );
      },
    ));

    return doc.save();
  }
}