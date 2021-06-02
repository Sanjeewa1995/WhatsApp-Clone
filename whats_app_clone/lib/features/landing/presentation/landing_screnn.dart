import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceTyoe) {
      print(100.h);
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(height: 5.h),
              Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: Image.asset(
                  'images/bg.png',
                  color: Colors.greenAccent[700],
                ),
              ),
              if (orientation == Orientation.portrait)
                SizedBox(
                  height: 10.h,
                ),
              if (!(orientation == Orientation.portrait)) SizedBox(height: 3.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Agree and Continue to accept the',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 10.sp)),
                      TextSpan(
                          text: ' WhatsApp Terms of Service and Privecy Policy',
                          style:
                              TextStyle(color: Colors.cyan, fontSize: 10.sp)),
                    ])),
              ),
              SizedBox(height: 5.h),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width - 110,
                  height: 8.h,
                  color: Colors.greenAccent,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.zero,
                    color: Colors.greenAccent[400],
                    child: Center(
                      child: Text(
                        'AGREE AND CONTINUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
            ],
          )),
        ),
      );
    });
  }
}
