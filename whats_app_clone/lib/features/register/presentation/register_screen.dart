import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:whats_app_clone/core/presentation/device_layout.dart';
import 'package:whats_app_clone/features/register/presentation/bloc/resgister_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen() : super();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _verificationId;
  final SmsAutoFill _autoFill = SmsAutoFill();

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      showSnackbar(
          "Phone number automatically verified and user signed in: ${_auth.currentUser!.uid}");
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showSnackbar(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      showSnackbar('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      showSnackbar("verification code: " + verificationId);
      _verificationId = verificationId;
    };

    void verifyPhoneNumber() async {
      try {
        await _auth.verifyPhoneNumber(
            phoneNumber: _phoneNumberController.text,
            timeout: const Duration(seconds: 5),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      } catch (e) {
        showSnackbar("Failed to Verify Phone Number: $e");
      }
    }

    void signInWithPhoneNumber() async {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: _smsController.text,
        );

        final User user = (await _auth.signInWithCredential(credential)).user!;

        showSnackbar("Successfully signed in UID: ${user.uid}");
      } catch (e) {
        showSnackbar("Failed to sign in: " + e.toString());
      }
    }

    double blocSizeHorizontal = getBlockSizeHorizontal(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Builder(builder: (context) {
          final phoneNumberState = context.watch<RegisterBloc>().state;
          if (phoneNumberState is GetPhoneNumberCompleted) {
            _phoneNumberController.text = phoneNumberState.phoneNumber!;
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: blocSizeHorizontal * 9, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Verfy your phone number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: blocSizeHorizontal * 20,
                        child: TextFormField(
                          controller: _countryCodeController,
                          decoration: InputDecoration(
                            labelText: '+94',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff075e54), width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff075e54), width: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: blocSizeHorizontal * 2),
                      Container(
                        width: blocSizeHorizontal * 60,
                        child: TextFormField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            labelText: 'Phone number (+xx xxx-xxx-xxxx)',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff075e54), width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff075e54), width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff25D366),
                          textStyle: TextStyle(fontSize: 19),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12)),
                      onPressed: () async {
                        // setState(() async {
                        //   _phoneNumberController.text = (await _autoFill.hint)!;
                        // });

                        // FirebaseAuthUi.instance()
                        //     .launchAuth([AuthProvider.phone()])
                        //     .then((value) => print(value.displayName))
                        //     .catchError((e) => print(e.toString()));
                      },
                      child: Text('Send Code'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text("Verify Number"),
                      onPressed: () async {
                        verifyPhoneNumber();
                      },
                    ),
                  ),
                  TextFormField(
                    controller: _smsController,
                    decoration:
                        const InputDecoration(labelText: 'Verification code'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () async {
                          signInWithPhoneNumber();
                        },
                        child: Text("Sign in")),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}
