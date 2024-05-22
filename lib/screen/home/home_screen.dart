import 'package:flutter/material.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  TextEditingController txeName = TextEditingController();
  TextEditingController txeEmail = TextEditingController();
  TextEditingController txePhone = TextEditingController();
  TextEditingController txeAddress = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text("HomeScreen", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Primary,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text("Userdata",
                      style: TextStyle(color: Colors.black, fontSize: 30)),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "name",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: txeName,
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            label: Text("Enter Name"),
                            labelStyle: TextStyle(
                                fontSize: 20, color: Color(0xffc4c4c4)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "name is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: txeEmail,
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            label: Text("Enter Email"),
                            labelStyle: TextStyle(
                                fontSize: 20, color: Color(0xffc4c4c4)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Mobile number",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: txePhone,
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            label: Text("Enter Mobile number"),
                            labelStyle: TextStyle(
                                fontSize: 20, color: Color(0xffc4c4c4)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "mobile number is  required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: txeAddress,
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            label: Text("Enter Address"),
                            labelStyle: TextStyle(
                                fontSize: 20, color: Color(0xffc4c4c4)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "address is required";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {

                        if (formKey.currentState!.validate())
                        {
                          name = txeName.text;
                          email = txeEmail.text;
                          mobilenumber = txePhone.text;
                          address = txeAddress.text;
                          Navigator.pushNamed(context, 'product');
                        }

                    },
                    child: const Text(
                      "submit",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),

      ),
    );
  }
}
