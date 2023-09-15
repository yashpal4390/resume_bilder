import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:printing/printing.dart';
import 'package:resume_bilder/views/ruseme.dart';



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
        return pw.Column(
          children: [
            pw.Center(child: pw.Text("Resume", style: pw.TextStyle(fontWeight:pw.FontWeight.bold, fontSize: 25))),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        myResume?.name ?? "",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text("${myResume?.address1}\n${myResume?.address2}\n${myResume?.address3}"),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                        text: pw.TextSpan(
                          style: pw.TextStyle(color: PdfColors.black),
                          children: [
                            pw.TextSpan(
                              text: "Email : ",
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                            ),
                            pw.TextSpan(
                              text: myResume?.email??"",
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          style: pw.TextStyle(color: PdfColors.black),
                          children: [
                            pw.TextSpan(
                              text: "Contact No : ",
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                            ),
                            pw.TextSpan(
                              text: "${myResume?.phone??""}",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Container(
              padding:pw.EdgeInsets.all(8),
              color: PdfColors.grey,
              width: double.infinity,
              child: pw.Text("Objective"),
            )
          ],
        );
      },
    ));

    return doc.save();
  }
}
