import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/history_screen/components/history_content.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static String routeName = '/history_screen/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('History'),
            actions: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications)),
                ],
              ),
            ],
          ),
          body: SizedBox(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      bottom: 0,
                      left: 0,
                    ),
                  );
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 20,
                      right: 20,
                    ),
                    child: HistoryContent(),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
