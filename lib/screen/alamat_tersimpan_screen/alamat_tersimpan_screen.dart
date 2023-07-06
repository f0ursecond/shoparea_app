import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';

class AlamatTersimpanScreen extends StatelessWidget {
  const AlamatTersimpanScreen({super.key});

  static String routeName = '/alamat_tersimpan/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        width: kIsWeb ? 400 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Alamat Tersimpan'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const SaveCardAddress();
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: -5,
                  child: DefaultButton(
                    press: () {
                      Navigator.pushNamed(context, '/alamat_pengirman/');
                    },
                    text: 'Tambah alamat baru',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SaveCardAddress extends StatelessWidget {
  const SaveCardAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void push() {
      Navigator.pushNamed(context, '/alamat_pengirman/');
    }

    return GestureDetector(
      onTap: push,
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                width: 121,
                height: 22,
                child: const Center(
                  child: Text(
                    'Dipakai Sekarang',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Rumah',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Jl. Pekunden Timur III, Pekunden, Kec. Semarang T',
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
              const Text(
                '+62 885155167794',
              ),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Ubah alamat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
