import 'package:flutter/material.dart';
class SpaleScreen extends StatefulWidget {
  const SpaleScreen({super.key});

  @override
  State<SpaleScreen> createState() => _SpaleScreenState();
}
class _SpaleScreenState extends State<SpaleScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image:NetworkImage("https://offer.theinvoice.net/wp-content/uploads/2022/08/Invoice-logo.jpg"),)
      ),
    );
  }
}
