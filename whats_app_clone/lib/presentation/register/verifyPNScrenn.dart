import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/const.dart';

class VerifyPNScreen extends StatefulWidget {
  const VerifyPNScreen({Key key}) : super(key: key);

  @override
  _VerifyPNScreenState createState() => _VerifyPNScreenState();
}

class _VerifyPNScreenState extends State<VerifyPNScreen> {
  String _category = 'Sri Lanka';
  TextEditingController _codeController = TextEditingController()..text = '+94';
  TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity, height: 20),
            Text('Verify your phone number',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w900,
                    fontSize: 18)),
            SizedBox(height: 20),
            Text(
              pNumberVerify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).primaryColorDark,
                        size: 30,
                      ),
                      isExpanded: true,
                      items: countryCodes
                          .map((country) => DropdownMenuItem(
                              value: country['name'],
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      country['name'],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                      textAlign: TextAlign.center,
                                    )
                                  ])))
                          .toList(),
                      onChanged: (newValue) {
                        for (int i = 0; i < countryCodes.length; i++) {
                          if (countryCodes[i]['name'] == newValue) {
                            _codeController.text = countryCodes[i]['dial_code'];
                          }
                        }
                        setState(() {
                          _category = newValue;
                        });
                      },
                      value: _category,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark,
                                width: 2.0)),
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                            width: 70,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(color: Colors.black),
                              controller: _codeController,
                              decoration: InputDecoration(
                                // labelText: '',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        width: 2.0)),
                                fillColor: Colors.white,
                              ),
                            )),
                        SizedBox(width: 10),
                        Flexible(
                            child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(color: Colors.black),
                          controller: _numberController,
                          decoration: InputDecoration(
                            hintText: 'phone number',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColorDark,
                                    width: 2.0)),
                                    enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColorDark,
                                    width: 2.0)),
                            fillColor: Colors.white,
                          ),
                        ))
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 120),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).accentColor)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text('Next', style: TextStyle(fontSize: 17)),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
