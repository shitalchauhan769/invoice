import 'dart:io';
import 'package:flutter/material.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/global.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("productList",style: TextStyle(color: Colors.white)),
          backgroundColor: Primary,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              setState(() {
              });
              Navigator.pushNamed(context,'invoice');
            }, icon: Icon(Icons.save_alt_outlined,color: Colors.white),),
            Padding(padding: EdgeInsets.only(right: 1),),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: List.generate(ProductList.length, (index) =>  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                         CircleAvatar(
                           radius: 50,
                           backgroundImage: FileImage(File('${ProductList[index].image}')),
                         ),
                          const SizedBox(
                            width: 30,
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               '${ProductList[index].name}',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                               '${ProductList[index].price}',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      ProductList.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                              Text("${ProductList[index].totalprice}"),
                            ],
                          ),
                        ],
                      ),
                    ),)
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton:  FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            setState(() {
            });
            Navigator.pushNamed(context, 'create').then((value) => setState(() {
            }));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
  // int total(int p, int q) {
  //   return p * q;
 // }
}

