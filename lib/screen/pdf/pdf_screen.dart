import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../utils/global.dart';
void inovicepdf() async {
  final pdf = pw.Document();
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        DateTime now = DateTime.now();
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Column(
            children: [
              pw.Text(
                "invoice",
                style: pw.TextStyle(
                    fontSize: 30,
                    fontWeight: pw.FontWeight.bold),
              ),
              pw.Column(
                children: List.generate(
                    1,
                    (index) => pw.Padding(
                          padding: const pw.EdgeInsets.all(10.0),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Divider(),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "name:=${name}",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  pw.Text(
                                    "address:=${address}",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  pw.Text(
                                    "date:=${now.day}-${now.month}-${now.year}",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  pw.Text(
                                    "Time:=${now.hour}:${now.minute}:${now.second}",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              pw.Divider(),
                              pw.SizedBox(height: 10),
                              pw.Row(
                                children: [
                                  pw.Text(
                                    "Qty",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  pw.SizedBox(
                                    width: 60,
                                  ),
                                  pw.Text(
                                    "Descriptor",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  pw.SizedBox(
                                    width: 60,
                                  ),
                                  pw.Text(
                                    "Price",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  pw.SizedBox(
                                    width: 60,
                                  ),
                                  pw.Text(
                                    "Amount",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              pw.Divider(
                                thickness: 1,
                              ),
                              pw.SizedBox(height: 10),
                              pw.Column(
                                children: List.generate(
                                    ProductList.length,
                                    (index) => pw.Column(
                                          children: [
                                            pw.Row(
                                              children: [
                                                pw.Text(
                                                  "${ProductList[index].quantity}",
                                                  style: pw.TextStyle(
                                                      fontWeight:
                                                          pw.FontWeight.bold,
                                                    ),
                                                ),
                                                pw.SizedBox(
                                                  width: 80,
                                                ),
                                                pw.Text(
                                                    "${ProductList[index].name}",
                                                    style: pw.TextStyle(
                                                        fontWeight:
                                                            pw.FontWeight.bold,
                                                    )),
                                                pw.SizedBox(
                                                  width: 80,
                                                ),
                                                pw.Text(
                                                    "${ProductList[index].price}",
                                                    style: pw.TextStyle(
                                                        fontWeight:
                                                            pw.FontWeight.bold,
                                                    )),
                                                pw.SizedBox(
                                                  width: 80,
                                                ),
                                                pw.Text(
                                                    "${ProductList[index].totalprice}")
                                              ],
                                            ),
                                          ],
                                        )),
                              ),
                              pw.Divider(),
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: pw.Text(
                                    "totalAmount:=",
                                    style: const pw.TextStyle(
                                    ),
                                  ))
                            ],
                          ),
                        )),
              )
            ],
          ),
        );
      },),);
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async =>pdf.save());
}
