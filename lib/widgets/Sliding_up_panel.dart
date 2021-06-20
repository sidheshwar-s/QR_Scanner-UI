import 'dart:convert';

import 'package:barcode_scanner/widgets/Contact_info.dart';
import 'package:barcode_scanner/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController? controller;
  final PanelController panelController;
  const PanelWidget({Key? key, this.controller, required this.panelController})
      : super(key: key);

  @override
  _PanelWidgetState createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  Map? personInfo;
  fetchPersonInfo() async {
    http.Response response =
        await http.get(Uri.parse('https://fakeface.rest/face/json'));
    setState(() {
      personInfo = jsonDecode(response.body);
    });
  }

  void togglepanel() {
    widget.panelController.isPanelOpen
        ? widget.panelController.close()
        : widget.panelController.open();
    setState(() {});
  }

  @override
  void initState() {
    fetchPersonInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            draghandel(),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Search Contact",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hintText: "Select Number",
              horizontal_padding: 10,
              suffixIcons: Icon(
                Icons.book,
                color: Theme.of(context).accentColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ContactInfo(
              name: "Sumath Varma",
              phoneNumber: "7530009088",
              personInfo: personInfo,
            ),
            const SizedBox(
              height: 20,
            ),
            ContactInfo(
              name: "Sunil Varma",
              phoneNumber: "8930009088",
              personInfo: personInfo,
            ),
            const SizedBox(
              height: 20,
            ),
            ContactInfo(
              name: "Drake",
              phoneNumber: "9876543210",
              personInfo: personInfo,
            ),
            const SizedBox(
              height: 20,
            ),
            ContactInfo(
              name: "Justin",
              phoneNumber: "9876543390",
              personInfo: personInfo,
            ),
          ],
        ),
      ),
    );
  }

  Widget draghandel() => GestureDetector(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 8,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        onTap: togglepanel,
      );
}
