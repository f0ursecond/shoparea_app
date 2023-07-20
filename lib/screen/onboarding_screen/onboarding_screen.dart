import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/consts/consts.dart';
import 'package:shoparea_app/models/Onboarding.dart';
import 'package:shoparea_app/screen/onboarding_screen/components/pageview_item.dart';
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
                const Logo(),
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
                        itemBuilder: (context, index) => PageViewItem(
                          index: index,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: DefaultButton(
                    text: 'Mulai Sekarang',
                    press: () {
                      Navigator.pushNamed(context, '/welcome_screen/');
                    },
                  ),
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
