import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/size_config.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    required this.name,
    required this.itemCount,
    required this.controller,
    required this.txtBtn,
    required this.title,
  });

  final List<String> name;
  final int itemCount;
  final TextEditingController controller;
  final String txtBtn;
  final String title;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do e',
          ),
          SizedBox(
            height: kIsWeb
                ? getWebProportionateScreenHeight(24)
                : getProportionateScreenHeight(24),
          ),
          const TextField(
            decoration: InputDecoration(
                hintText: 'Cari',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.itemCount,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    widget.controller.text = widget.name[index];
                  });
                  Navigator.pop(context);
                },
                title: Text(widget.name[index]),
              );
            },
          ),
          SizedBox(
            height: kIsWeb
                ? getWebProportionateScreenHeight(24)
                : getProportionateScreenHeight(24),
          ),
          DefaultButton(press: () {}, text: 'Gunakan sebagai ${widget.txtBtn}'),
        ],
      ),
    );
  }
}
