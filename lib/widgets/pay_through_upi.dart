import 'package:barcode_scanner/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PayThroughUPI extends StatelessWidget {
  const PayThroughUPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Text(
            "Pay through UPI",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          hintText: "Enter UPI Number",
          horizontal_padding: 25,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
