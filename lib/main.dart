import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_kitchen/View/SplashScreen/splash_screen.dart';
import 'Controller/employee_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Provider init...................
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmployeeProvider>(
            create: (_) => EmployeeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SpalshScreen(),
      ),
    );
  }
}
