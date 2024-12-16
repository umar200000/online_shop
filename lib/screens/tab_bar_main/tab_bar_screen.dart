import 'package:flutter/material.dart';
import 'package:homework_8/screens/tab_bar_main/tabs.dart';

import 'all_page.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  void workOne() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const Tabs(),
          Expanded(
              child: TabBarView(
            children: [
              AllPage(
                index: 0,
                workOne: workOne,
              ),
              AllPage(index: 1, workOne: workOne),
            ],
          )),
        ],
      ),
    );
  }
}
