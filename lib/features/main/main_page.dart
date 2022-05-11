import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyre_test/core/utils/assets.dart';
import 'package:qyre_test/features/details/details_page.dart';
import 'package:qyre_test/features/home/home_page.dart';
import 'package:qyre_test/features/notifications/notifications_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? _tabController;
  final List<String> _tabIcons = [
    AppAssets.homeIcon,
    AppAssets.menuIcon,
    AppAssets.notificationIcon,
  ];
  final List<Widget> _widgetOptions = const [
    HomePage(),
    DetailsPage(),
    NotificationsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _widgetOptions.length,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_tabController!.index),
      bottomNavigationBar: Container(
        height: 64.h,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
            onTap: (tab) {
              setState(() {});
            },
            tabs: List.generate(3, (index) {
              return Tab(
                icon: SvgPicture.asset(
                  _tabIcons[index],
                ),
              );
            }),
            labelPadding: const EdgeInsets.only(bottom: 0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}
