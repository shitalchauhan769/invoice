import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/global.dart';

import '../model/model_screen.dart';
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController txename = TextEditingController();
  TextEditingController txePrice = TextEditingController();
  TextEditingController  txeQuantity= TextEditingController();
  TextEditingController txeDiscount = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? path;
  ImagePicker picker=ImagePicker();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 100,backgroundImage: FileImage(File("$path")),
                          ),
                          Align(
                            child: IconButton.filled(
                              onPressed:()async{
                                XFile? image=await picker.pickImage(source: ImageSource.gallery);
                                setState(() {
                                  path=image!.path;
                                });
                              }, icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      Form(key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Product Name",style: TextStyle(fontSize: 20,color: Colors.black),),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: txename,
                              decoration: const InputDecoration(
                                fillColor: Colors.grey,
                                label: Text("Product Name"),
                                labelStyle: TextStyle(
                                    fontSize: 18, color: Color(0xffc4c4c4)),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Product Name is required";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 10,),
                            Text("Product Price",style: TextStyle(fontSize: 20,color: Colors.black),),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: txePrice,
                              decoration: const InputDecoration(
                                fillColor: Colors.grey,
                                label: Text(" Price"),
                                labelStyle: TextStyle(
                                    fontSize: 18, color: Color(0xffc4c4c4)),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Product price is required";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 10,),
                            Text("Product Quantity",style: TextStyle(fontSize: 20,color: Colors.black),),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: txeQuantity,
                              decoration: const InputDecoration(
                                fillColor: Colors.grey,
                                label: Text(" Quantity "),
                                labelStyle: TextStyle(
                                    fontSize: 18, color: Color(0xffc4c4c4)),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Product Quantity is required";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 10,),
                            Text("Product Discount",style: TextStyle(fontSize: 20,color: Colors.black),),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: txeDiscount,
                              decoration: const InputDecoration(
                                fillColor: Colors.grey,
                                label: Text("Discount"),
                                labelStyle: TextStyle(
                                    fontSize: 18, color: Color(0xffc4c4c4)),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Product Discount is required";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      ElevatedButton(onPressed: () {
                        setState(() {
                          if(formKey.currentState!.validate())
                          {
                            String?name = txename.text;
                            String?price=txePrice.text;
                            String?quantity=txeQuantity.text;
                            String?discount=txeDiscount.text;
                            String?image=path;
                            int?amount;
                            int? totalprice;
                            totalprice = int.parse(price) * int.parse(quantity) ;
                            ProductModel p1=ProductModel(name,price,quantity,discount,image,totalprice as int?,amount);
                            ProductList.add(p1);
                            Navigator.pop(context);
                          }
                        });

                      }, child: Text("Add to cart",style: TextStyle(fontSize: 17),))
                    ],
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

