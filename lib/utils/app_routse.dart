import 'package:flutter/material.dart';
import 'package:invoice_app/screen/home/home_screen.dart';
import 'package:invoice_app/screen/invoice/invoice_screen.dart';
import 'package:invoice_app/screen/product/product_screen.dart';
import 'package:invoice_app/screen/spale/spale_screen.dart';
import '../screen/create/create_screen.dart';
Map<String,WidgetBuilder>app_routs=
{'/':(context) =>SpaleScreen(),
  'home':(context) => HomeScreen(),
  'product':(context) => const ProductScreen(),
  'create':(context) =>  CreateScreen(),
  'invoice':(context) =>InvoiceScreen(),
};
