import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/core/const.dart';
import 'package:whats_app_clone/features/register/domain/usecase/get_country_info.dart';
import 'package:whats_app_clone/features/register/presentation/bloc/resgister_bloc.dart';

class VerifyPNScreen extends StatefulWidget {
  const VerifyPNScreen() : super();

  @override
  _VerifyPNScreenState createState() => _VerifyPNScreenState();
}

class _VerifyPNScreenState extends State<VerifyPNScreen> {
  late RegisterBloc bloc;
  String _category = 'Sri Lanka';
  TextEditingController _codeController = TextEditingController()..text = '+94';
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Builder(builder: (context) {
        final phoneNumberState = context.watch<RegisterBloc>().state;
        if (phoneNumberState is GetPhoneNumberCompleted) {
          _phoneNumberController.text = phoneNumberState.phoneNumber!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: double.infinity, height: 20),
              Text('Verify your phone number',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
                          CountryInfoParams countryInfoParams =
                              CountryInfoParams(newValue.toString());
                          bloc.add(GetCountryCode(countryInfoParams));
                        },
                        value: _category,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0)),
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              if (state is GetCountryCodeCompleted) {
                                _codeController.text = state.countryInfo.code;
                                return codeTextField();
                              }
                              return codeTextField();
                            },
                          ),
                          SizedBox(width: 10),
                          Flexible(
                              child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                            textAlignVertical: TextAlignVertical.top,
                            style: TextStyle(color: Colors.black),
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              hintText: 'phone number',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
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
                          Theme.of(context).colorScheme.secondary)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text('Next', style: TextStyle(fontSize: 17)),
                  ),
                  onPressed: () {})
            ],
          );
        }
        return CircularProgressIndicator();
      })),
    );
  }

  Widget codeTextField() {
    return Container(
        width: 70,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(color: Colors.black),
          controller: _codeController,
          decoration: InputDecoration(
            // labelText: '',
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2.0)),
            fillColor: Colors.white,
          ),
        ));
  }
}
