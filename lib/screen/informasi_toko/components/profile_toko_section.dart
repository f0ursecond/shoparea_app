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
    Key? key,
  }) : super(key: key);

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
            radius: 100,
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

                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                        maxWidth: kIsWeb ? 400 : double.infinity,
                      ),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/images/check.png"),
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
                  child: SvgPicture.asset("assets/icons/icon_links.svg"),
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
