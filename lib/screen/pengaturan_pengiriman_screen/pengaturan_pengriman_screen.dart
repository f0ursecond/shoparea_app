import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/size_config.dart';

class ShippingSettingsScreen extends StatefulWidget {
  const ShippingSettingsScreen({super.key});

  static String routeName = '/pengaturan_pengiriman/';

  @override
  State<ShippingSettingsScreen> createState() => _ShippingSettingsScreenState();
}

class _ShippingSettingsScreenState extends State<ShippingSettingsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.black) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Atur Pengiriman'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                const Text(
                  'Kurir Partner Shoparea',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: -1,
                  child: TabBar(
                    indicatorColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.green,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Semua Kurir',
                      ),
                      Tab(
                        text: 'Durasi',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      SemuaKurir(),
                      Center(
                        child: Text("It's Durasi here"),
                      ),
                    ],
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

class SemuaKurir extends StatefulWidget {
  const SemuaKurir({
    super.key,
  });

  @override
  State<SemuaKurir> createState() => _SemuaKurirState();
}

bool isOn = false;

final List<Map<String, dynamic>> partnerKurir = [
  {
    'kurirName': 'JNE',
    'price': 'Rp: 20.000',
    'status': isOn,
  },
  {
    'kurirName': 'JNT',
    'price': 'Rp: 10.000',
    'status': isOn,
  },
  {
    'kurirName': 'Grab',
    'price': 'Rp: 12.000',
    'status': isOn,
  },
  {
    'kurirName': 'Gojek',
    'price': 'Rp: 40.000',
    'status': isOn,
  },
];
final List<Map<String, dynamic>> kurirbiasa = [
  {
    'kurirName': 'Pelanggan Ambil Sendiri',
    'status': isOn,
  },
  {
    'kurirName': 'Kurir Saya',
    'status': isOn,
  },
];

class _SemuaKurirState extends State<SemuaKurir> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: partnerKurir.length,
            itemBuilder: (context, index) {
              var kurir = partnerKurir[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 24,
                  color: Colors.amber,
                ),
                title: Text(kurir['kurirName']),
                subtitle: Text(kurir['price']),
                trailing: Switch(
                  value: kurir['status'],
                  onChanged: (value) {
                    setState(() {
                      kurir['status'] = value;
                    });
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: -1,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              var kurir = kurirbiasa[index];
              return ListTile(
                title: Text(kurir['kurirName']),
                trailing: Switch(
                  value: kurir['status'],
                  onChanged: (value) {
                    setState(() {
                      kurir['status'] = value;
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(12)
              : getProportionateScreenHeight(12),
        ),
        const Text(
          'Biaya layanan 2% diberlakukan untuk semua\npesanan yang dikirim oleh kurir partner Shoparea',
          style: TextStyle(fontSize: 14, color: Colors.green),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(24)
              : getProportionateScreenHeight(24),
        ),
        DefaultButton(
          press: () {
            Navigator.pushNamed(context, '/alamat_tersimpan/');
          },
          text: 'Simpan',
        ),
      ],
    );
  }
}
