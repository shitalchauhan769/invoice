import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoice_app/screen/model/model_screen.dart';
import 'package:invoice_app/screen/pdf/pdf_screen.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/global.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

@override
class _InvoiceScreenState extends State<InvoiceScreen> {

  @override
  void initState() {
    super.initState();
    get_time();
    for ( dynamic i = 0; i < ProductList.length; i++) {
      total = total + int.parse('${ProductList[i].totalprice}');
    }
  }
  DateTime now = DateTime.now();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  dynamic total = 0;

  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            "invoice screen",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                inovicepdf();
              },
              icon: Icon(Icons.save_alt_outlined, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 1),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "invoice",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(
                    1,
                    (index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "name:=${name}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "address:=${address}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "date:=${now.day}-${now.month}-${now.year}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Time:=${now.hour}:${now.minute}:${now.second}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Qty",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    "Descriptor",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: List.generate(
                                    ProductList.length,
                                    (index) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${ProductList[index].quantity}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  width: 80,
                                                ),
                                                Text(
                                                    "${ProductList[index].name}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                const SizedBox(
                                                  width: 80,
                                                ),
                                                Text(
                                                    "${ProductList[index].price}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                const SizedBox(
                                                  width: 80,
                                                ),
                                                Text(
                                                    "${ProductList[index].totalprice}")
                                              ],
                                            ),
                                          ],
                                        )),
                              ),
                              Divider(),
                              Text(
                                "totalAmount:=$total",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void get_time() {
    Future.delayed(Duration(seconds: 1), () {
      get_time();
    });
  }

}


