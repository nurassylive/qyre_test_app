import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qyre_test/features/home/widgets/activities/activities_view.dart';
import 'package:qyre_test/features/home/widgets/availability/availability_calendar.dart';
import 'package:qyre_test/features/home/widgets/availability/availability_list_view.dart';
import 'package:qyre_test/features/home/widgets/offers/offers_view.dart';
import 'package:qyre_test/features/home/widgets/posts/posts_view.dart';
import 'package:qyre_test/features/home/widgets/productions/productions_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  bool _appendAppBarHeight = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 130) {
        setState(() {
          _appendAppBarHeight = true;
        });
      } else {
        setState(() {
          _appendAppBarHeight = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (
          context,
          innerBoxIsScrolled,
        ) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarColor: Colors.transparent,
                ),
                foregroundColor: Colors.transparent,
                centerTitle: false,
                title: Text(
                  'My Availability',
                  style: Theme.of(context).textTheme.headline1,
                ),
                floating: true,
                pinned: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: _appendAppBarHeight
                    ? PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 200),
                          builder: (_, double val, __) {
                            return AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: val,
                              child: Transform.translate(
                                offset: Offset(0, -(10 - val * 10)),
                                child: AvailabilityCalendar(
                                  inAppBar: true,
                                  padding: const EdgeInsets.only(bottom: 10),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : null,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top +
                    AppBar().preferredSize.height,
              ),
              AvailabilityCalendar(inAppBar: false),
              AvailabilityListView(),
              const SizedBox(height: 30),
              const ProductionsView(),
              const SizedBox(height: 30),
              const ActivitiesView(),
              const SizedBox(height: 30),
              const OffersView(),
              const SizedBox(height: 30),
              const PostsView(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
