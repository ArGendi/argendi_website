

import 'package:AG/firebase_options.dart';
import 'package:AG/screens/desktop_screens/contact_us_screen.dart';
import 'package:AG/screens/desktop_screens/home_browser_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/screens/mobile_screens/wheel_screen.dart';
import 'package:AG/tabe3/constants.dart';
import 'package:AG/tabe3/cubits/all_sells/all_sells_cubit.dart';
import 'package:AG/tabe3/cubits/login/login_cubit.dart';
import 'package:AG/tabe3/cubits/products/products_cubit.dart';
import 'package:AG/tabe3/cubits/reports/reports_cubit.dart';
import 'package:AG/tabe3/cubits/sides/sides_cubit.dart';
import 'package:AG/tabe3/view/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => ProductsCubit()),
        BlocProvider(create: (_) => SidesCubit()),
        BlocProvider(create: (_) => AllSellsCubit()),
        BlocProvider(create: (_) => ReportsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ArGendi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
