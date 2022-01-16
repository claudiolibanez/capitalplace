import 'package:flutter/material.dart';

// constants
import 'package:capitalplace/src/core/constants/app_constants.dart';

import 'package:capitalplace/src/features/auth/presenter/pages/login_page.dart';

// widgets
import 'package:capitalplace/src/core/widgets/button_widget.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  final int _lastPage = contents.length - 1;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.transparent,
      ),
    );

    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: PageView.builder(
                controller: _pageController,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (contents[i].heading != null)
                          Column(
                            children: [
                              Text(
                                contents[i].heading!,
                                style: AppTypographyConstants.heading.copyWith(
                                  color: AppColorConstants.primary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                            ],
                          ),
                        Image.asset(
                          contents[i].image,
                          width: width * .65,
                          fit: BoxFit.fitWidth,
                        ),
                        if (contents[i].title != null)
                          Column(
                            children: [
                              const SizedBox(
                                height: 24.0,
                              ),
                              Text(
                                contents[i].title!,
                                style: AppTypographyConstants.heading.copyWith(
                                  color: AppColorConstants.primary,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        if (contents[i].subtitle != null)
                          Text(
                            contents[i].subtitle!,
                            style: AppTypographyConstants.body.copyWith(
                              color: AppColorConstants.text.withOpacity(.5),
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: height * .3,
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: _currentIndex != _lastPage ? 58 : 20.0,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: _currentIndex != _lastPage ? 100.0 : 50.0,
                        ),
                        child: Column(
                          children: [
                            if (_currentIndex == _lastPage)
                              Column(
                                children: [
                                  Text(
                                    "Você tem uma conta?",
                                    style: AppTypographyConstants.body.copyWith(
                                      color: AppColorConstants.text
                                          .withOpacity(.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24.0,
                                  ),
                                ],
                              ),
                            _currentIndex != _lastPage
                                ? ButtonWidget(
                                    title: AppStringConstants
                                        .onboardingButtonInvestNow,
                                    trailing: const Icon(
                                      Icons.chevron_right,
                                      size: 22.0,
                                      color: AppColorConstants.white,
                                    ),
                                    iconSize: 22.0,
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      LoginPage.route,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: ButtonWidget(
                                          title: "Registrar",
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Expanded(
                                        child: ButtonWidget(
                                          title: "Login",
                                          typography: AppTypographyConstants
                                              .button
                                              .copyWith(
                                            color: AppColorConstants.primary,
                                          ),
                                          background: AppColorConstants.white,
                                          side: const BorderSide(
                                            color: AppColorConstants.primary,
                                            width: 2.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _currentIndex != _lastPage
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vamos investir agora?",
                                  style: AppTypographyConstants.body.copyWith(
                                    color:
                                        AppColorConstants.text.withOpacity(.5),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Começar",
                                    style: AppTypographyConstants.link.copyWith(
                                      color: AppColorConstants.primary,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50.0,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Se você possui uma conta neste aplicativo, basta clicar para fazer o ",
                                      style:
                                          AppTypographyConstants.body.copyWith(
                                        color: AppColorConstants.text
                                            .withOpacity(.5),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Login",
                                      style:
                                          AppTypographyConstants.link.copyWith(
                                        color: AppColorConstants.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: _currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(
        right: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: _currentIndex == index
            ? AppColorConstants.primary
            : AppColorConstants.text.withOpacity(.5),
      ),
    );
  }
}

class OnboardingContentParams {
  final String? heading;
  final String? title;
  final String? subtitle;
  final String image;

  OnboardingContentParams({
    this.heading,
    this.title,
    this.subtitle,
    required this.image,
  });
}

List<OnboardingContentParams> contents = [
  OnboardingContentParams(
    image: AppImageConstants.capitalPlaceLogo,
  ),
  OnboardingContentParams(
    title: "Insight em Investimento",
    subtitle:
        "Taxa zero na abertura de conta e atendimento de qualidade, abra sua conta.",
    image: AppImageConstants.onboardingImg01,
  ),
  OnboardingContentParams(
    heading: "Agora é hora de investir seu dinheiro!",
    image: AppImageConstants.onboardingImg02,
  ),
];

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
