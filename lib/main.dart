import 'package:barcode_scanner/screens/screens.dart';
import 'package:barcode_scanner/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final panelController = PanelController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner',
      theme: ThemeData(
        accentColor: Color(0xffB198F7),
        primaryColor: Colors.white,
        fontFamily: 'Circular',
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          centerTitle: true,
          title: Text(
            "Savings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
        ),
        body: SlidingUpPanel(
          controller: panelController,
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          minHeight: 200,
          body: Homepage(),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            panelController: panelController,
          ),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
        ),
      ),
    );
  }
}
