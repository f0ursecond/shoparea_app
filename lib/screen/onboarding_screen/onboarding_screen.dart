import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/consts/consts.dart';
import 'package:shoparea_app/models/onboarding_content.dart';

import 'package:shoparea_app/screen/onboarding_screen/components/title_text.dart';
import 'package:shoparea_app/screen/welcome_screen/welcome_screen.dart';
import 'package:shoparea_app/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Logo(),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                    ),
                    child: SizedBox(
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: content.length,
                        itemBuilder: (context, index) => Image(
                          image: AssetImage(
                            content[index].image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(50)
                      : getProportionateScreenHeight(50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    content.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                SizedBox(
                  height: getWebProportionateScreenHeight(50),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      const TitleText(
                        title: 'Buat Toko Online Kamu\n Sendiri Dengan Mudah',
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Lorem ipsum is placeholder text commonly used\nin the graphic, print, and publishing industries for',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: DefaultButton(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(
        right: kIsWeb
            ? getWebProportionateScreenWidth(5)
            : getProportionateScreenWidth(5),
      ),
      height: kIsWeb
          ? getWebProportionateScreenWidth(6)
          : getProportionateScreenWidth(6),
      width: currentPage == index
          ? kIsWeb
              ? getWebProportionateScreenWidth(20)
              : getProportionateScreenWidth(20)
          : kIsWeb
              ? getWebProportionateScreenWidth(6)
              : getProportionateScreenWidth(6),
      decoration: BoxDecoration(
        color: currentPage == index ? cColorPrimary50 : cColorNeutral50,
        borderRadius: BorderRadius.circular(
          kIsWeb
              ? getWebProportionateScreenWidth(3)
              : getProportionateScreenWidth(3),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      width: kIsWeb ? 400.0 : double.infinity,
      height: kIsWeb ? 48.0 : 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        },
        child: Text('Mulai Sekarang'),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 112,
        right: 112,
      ),
      child: Image(
        image: AssetImage('assets/images/techarealogosmall.png'),
      ),
    );
  }
}
