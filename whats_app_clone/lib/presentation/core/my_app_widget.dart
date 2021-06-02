import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/core/injection/injection.dart';
import 'package:whats_app_clone/features/home/presentation/screens/home_screen.dart';
import 'package:whats_app_clone/features/landing/presentation/landing_screnn.dart';
import 'package:whats_app_clone/features/select_contact/presentation/bloc/select_contact_bloc.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: Color(0xff075e54),

          // accentColor: Color(0xff25D366),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
