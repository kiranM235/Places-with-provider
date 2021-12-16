import 'package:flutter/material.dart';
import 'package:places/src/screens/dashboard/my_places_view.dart';
import 'package:places/src/screens/dashboard/profile_detail_view.dart';
import 'package:places/src/widgets/shared/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
        return [_buildHeader(context, innerBoxScrolled)];
      },
      body: _buildTabBarView(context),
    );
  }

  Widget _buildHeader(BuildContext context, bool innerBoxScrolled) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: whiteColor,
      forceElevated: innerBoxScrolled,
      title: Text("Profile", style: Theme.of(context).textTheme.headline6),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.person), text: "Me"),
          Tab(icon: Icon(Icons.location_on_outlined), text: "My Places"),
        ],
        physics: BouncingScrollPhysics(),
        indicatorColor: blackColor87,
        labelColor: blackColor87,
        labelStyle: TextStyle(color: blackColor87),
        indicatorPadding: EdgeInsets.all(8),
      ),
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        ProfileDetail(),
        MyPlacesScreen(),
      ],
    );
  }
}