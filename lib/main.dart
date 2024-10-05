import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'constants/strings.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen(
    (user) {
      if (user == null) {
        initialRoute = mapScreen;
      } else {
        initialRoute = loginScreen;
      }
    },
  );

  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRoutes});

  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateRoute,
      initialRoute: initialRoute,
      title: 'Flutter Demo',
    );
  }
}
