import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_ui/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_ui/firebase_auth_ui.dart';
import 'package:sms_autofill/sms_autofill.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _verificationId;
  final SmsAutoFill _autoFill = SmsAutoFill();

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      showSnackbar(
          "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showSnackbar(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
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
        showSnackbar("Failed to Verify Phone Number: ${e}");
      }
    }

    void signInWithPhoneNumber() async {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: _smsController.text,
        );

        final User user = (await _auth.signInWithCredential(credential)).user;

        showSnackbar("Successfully signed in UID: ${user.uid}");
      } catch (e) {
        showSnackbar("Failed to sign in: " + e.toString());
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                  labelText: 'Phone number (+xx xxx-xxx-xxxx)'),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  setState(() async {
                    _phoneNumberController.text = await _autoFill.hint;
                  });

                  // FirebaseAuthUi.instance()
                  //     .launchAuth([AuthProvider.phone()])
                  //     .then((value) => print(value.displayName))
                  //     .catchError((e) => print(e.toString()));
                },
                child: Text('get phone number'),
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
              decoration: const InputDecoration(labelText: 'Verification code'),
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
      ),
    );
  }
}
