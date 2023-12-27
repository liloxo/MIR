import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../controller/pages/formationscontroller/formationpages/formationreserved_controller.dart';
import '../constants/sizes.dart';


Future<void> printDoc(List<GroupeStudents> students,String text) async {
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData( students,text);
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }


  buildPrintableData(List<GroupeStudents> students,String text) => pw.Padding(
  padding: const pw.EdgeInsets.all(10.00),
  child: pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
    pw.Text(text, style: pw.TextStyle(fontSize: 22, letterSpacing: 1,fontWeight: pw.FontWeight.bold)),
    pw.SizedBox(height: 20),
    pw.ListView.builder(
    padding: pw.EdgeInsets.zero,
    itemCount: students.length,
    itemBuilder: (context, i) {
      return pw.Container(
        width: double.infinity,
        margin: pw.EdgeInsets.only(bottom: Sizes.widthfifteen),
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(7),
          border: pw.Border.all(),
        ),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(students[i].name!, style: const pw.TextStyle(fontSize: 20, letterSpacing: 1)),
            pw.SizedBox(
              width: AppSize.width / 1.3,
              child:pw.Text(students[i].email!, style: const pw.TextStyle(fontSize: 17.5, letterSpacing: 1,),maxLines: 2,overflow: pw.TextOverflow.visible),
            )
          ],
        ),
      );
    },
  ),
  ])
);