import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OtherStatusCard extends StatelessWidget {
  const OtherStatusCard() : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsetsDirectional.only(start: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                DottedBorder(
                  color: Colors.green,
                  strokeWidth: 2,
                  dashPattern: [
                    39,
                    3,
                  ],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(122),
                  padding: EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(122)),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.amber,
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Malaka',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Just now',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            )),
        Padding(
          padding:
              const EdgeInsets.only(left: 80, right: 15, top: 2, bottom: 2),
          child: Container(
            height: 1,
            // width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
