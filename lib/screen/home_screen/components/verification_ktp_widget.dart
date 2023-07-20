import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class VerificationKtpContainer extends StatelessWidget {
  const VerificationKtpContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFE9F0F8),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image.asset('assets/images/icon_verification.png'),
            SizedBox(
              width: kIsWeb
                  ? getWebProportionateScreenWidth(12)
                  : getProportionateScreenWidth(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Lakukan verifikasi KTP untuk\naktifkan semua akses penjualan di\ntokomu',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(20)
                      : getProportionateScreenHeight(20),
                ),
                const Text(
                  'Siapkan KTP dan koneksi internet yang stabil',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            const Expanded(
              child: Icon(
                Icons.arrow_right_sharp,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
