import 'package:flower_shop/routes/generate_route.dart';
import 'package:flower_shop/views/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: GenerateRoute().generateRoute,
      initialRoute: LoginScreen.routeName,
      // navigatorObservers: [
      //   NewRelicNavigationObserver(),
      // ],
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
