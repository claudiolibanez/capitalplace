import 'package:flutter/material.dart';

// routes
import 'package:capitalplace/src/core/routes/app_routes.dart';

// dependency injection
import 'package:capitalplace/src/core/injection/container_injection.dart';

void main() {
  ContainerInjection.setup();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capital Place',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
