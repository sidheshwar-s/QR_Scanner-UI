import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final Map? personInfo;
  final String name;
  final String phoneNumber;
  const ContactInfo(
      {Key? key,
      this.personInfo,
      required this.name,
      required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return personInfo == null
        ? Center(child: CircularProgressIndicator())
        : Material(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage((personInfo as dynamic)['image_url']),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      phoneNumber,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
