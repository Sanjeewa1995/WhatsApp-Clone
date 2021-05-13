import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class StatusListTile extends StatelessWidget {
  const StatusListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text('Malaka',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
                Text('Just now',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal)),
                    Padding(
          padding: EdgeInsets.only(left:0, right: 0, top: 0),
          child: Container(
            height: 0.5,
            width: 255,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),  
              ],
            ),
              
          ],
        ));
  }
}
