// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/sized_box/horizontal_sized_box.dart';
import '../../../components/sized_box/vertical_sized_box.dart';
import '../../../components/teks/custom_teks.dart';
import '../../../consts/colors.dart';

class ProfileTokoSection extends StatefulWidget {
  ProfileTokoSection({
    super.key,
  });

  @override
  State<ProfileTokoSection> createState() => _ProfileTokoSectionState();
}

class _ProfileTokoSectionState extends State<ProfileTokoSection> {
  String teks = "www.linktoko.com";
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/iv_avatar_profile_2.png",
            ),
            radius: (100),
          ),
          VerticalSizedBox(height: 16),
          CustomText(
              teks: "Toko Sepatu",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              teksColor: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: teks));
                  setState(() {
                    isClicked = true;
                  });
                  Future.delayed(Duration(milliseconds: 200), () {
                    setState(() {
                      isClicked = false;
                    });

                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Dialog(
                          elevation: 2,
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  height: double.maxFinite,
                                  width: kIsWeb ? 400.0 : double.infinity,
                                  color: Colors.black,
                                ),
                              ),
                              Column(
                                children: [
                                  VerticalSizedBox(height: 100),
                                  Container(
                                    width: kIsWeb ? 352.0 : double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: cColorPrimary50,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/images/check.png"),
                                          HorizontalSizedBox(width: 24),
                                          CustomText(
                                            teks: "Copied to Clipboard",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            teksColor: cColorNeutralBlack50,
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Image.asset(
                                                "assets/images/cross.png"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isClicked ? cColorPrimary50 : Colors.transparent,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/icon_links.svg",
                  ),
                ),
              ),
              HorizontalSizedBox(width: 8),
              CustomText(
                teks: teks,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                teksColor: cColorSecondary50,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/ic_shop_address.svg"),
              HorizontalSizedBox(width: 8),
              Flexible(
                child: CustomText(
                  teks:
                      "Jl R Agil Kusumadya, Bulusan, Tembalang, Semarang, Jawa Tengah, Indonesia",
                  fontSize: 12,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  softWrap: false,
                  fontWeight: FontWeight.w400,
                  teksColor: cColorExpired50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
