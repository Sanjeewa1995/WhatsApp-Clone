import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/core/injection/injection.dart';
import 'package:whats_app_clone/features/home/presentation/screens/home_screen.dart';
import 'package:whats_app_clone/features/landing/presentation/landing_screnn.dart';
import 'package:whats_app_clone/features/register/presentation/bloc/resgister_bloc.dart';
import 'package:whats_app_clone/features/select_contact/presentation/bloc/select_contact_bloc.dart';
import 'package:whats_app_clone/features/register/presentation/register_screen.dart';
import 'package:whats_app_clone/features/register/presentation/verifyPNScrenn.dart';

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // lazy: false,
          create: (context) => getIt<SelectContactBloc>()
            ..add(const SelectContactEvent.getContactList()),
        ),
        BlocProvider(
         // lazy: true,
          create: (context) =>
              getIt<RegisterBloc>()..add(GetPhoneNumberEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'OpenSans',
            primaryColor: Color(0xff075e54),
            accentColor: Color(0xff25D366),
            buttonColor: Color(0xff25D366),
            buttonTheme: ButtonThemeData(buttonColor: Color(0xff25D366))),
        home: VerifyPNScreen(),
      ),
    );
  }
}
