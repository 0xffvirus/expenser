import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expenser/mainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:expenser/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
        "/test": (context) => const ListWanted()
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // This is required
      ],
    );
  }
}
