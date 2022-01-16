import 'package:flutter/material.dart';

// container injection
import 'package:capitalplace/src/core/injection/container_injection.dart';

// onboarding
import 'package:capitalplace/src/features/onboarding/presenter/pages/onboarding_page.dart';

// login
import 'package:capitalplace/src/features/auth/presenter/pages/login_page.dart';
import 'package:capitalplace/src/features/auth/presenter/controllers/login_controller.dart';

// login code
import 'package:capitalplace/src/features/auth/presenter/pages/login_code_page.dart';
import 'package:capitalplace/src/features/auth/presenter/controllers/login_code_controller.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    var newRoute;

    switch (settings.name) {
      case OnboardingPage.route:
        newRoute = MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        );
        break;
      case LoginPage.route:
        newRoute = MaterialPageRoute(
          builder: (context) => LoginPage(
            controller: i.get<LoginController>(),
          ),
        );
        break;
      case LoginCodePage.route:
        newRoute = MaterialPageRoute(
          builder: (context) => LoginCodePage(
            controller: i.get<LoginCodeController>(),
          ),
        );
        break;
    }

    return newRoute;
  }
}
