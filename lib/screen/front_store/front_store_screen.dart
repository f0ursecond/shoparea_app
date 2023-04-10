// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/body.dart';
import 'package:shoparea_app/size_config.dart';

class FrontStoreScreen extends StatelessWidget {
  const FrontStoreScreen({super.key});

  static String routeName = "/front_store";
  @override
  Widget build(BuildContext context) {
    // We have to call it on the starter screen
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: cColorPrimary50,
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: cColorPrimary50)),
          width: kIsWeb ? 400.0 : double.infinity,
          child: Scaffold(
            body: Body(),
          ),
        ),
      ),
    );
  }
}
