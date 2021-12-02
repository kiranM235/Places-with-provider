import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places/src/core/base_widget.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/core/navigation/route_paths.dart';
import 'package:places/src/screens/dashboard/explore_screen.dart';
import 'package:places/src/screens/dashboard/favorite_screen.dart';
import 'package:places/src/screens/dashboard/profile_screen.dart';
import 'package:places/src/utils/snackbar_helper.dart';
import 'package:places/src/viewmodels/dashboard/dashboard_view_model.dart';
import 'package:places/src/widgets/shared/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static const screens = [ExploreScreen(), FavoriteScreen(), ProfileScreen()];
  static const titles = ["Explore", "Favorite", "Profile"];


  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
        model: locator<DashboardViewModel>(),
        onModelReady: (model) {
          _onModelReady(context, model);
        },
        builder: (BuildContext context, DashboardViewModel model,
            Widget? child) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: _buildAppBar(context, model),
            body: _buildBody(model),
            bottomNavigationBar: _buildBottomNavigationBar(context, model),
            drawer: _buildNavigationDrawer(context, model),
          );
        }
    );
  }

  void _onModelReady(BuildContext context, DashboardViewModel model) {
    ///1. show a snack bar when connectivity changes
    _listenUserLocation(context, model);

    ///2. record user location
    _listenConnectivity(context);
  }

  void _listenConnectivity(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((event) {
      print("Connection status $event");
      if (event == ConnectivityResult.none) {
        showSnackBar(context, "No internet connection");
      } else {
        showSnackBar(context, "Back online");
      }
    });
  }


  AppBar _buildAppBar(BuildContext context, DashboardViewModel model) {
    return AppBar(
      title: Text(
          titles[model.currentIndex], style: TextStyle(color: blackColor87)),
      backgroundColor: whiteColor,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: blackColor87,
        ),
        onPressed: () {
          bool drawerOpen = _scaffoldKey.currentState!.isDrawerOpen;
          if (!drawerOpen) {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add,
            size: 40,
            color: blackColor87,
          ),
          onPressed: () => Navigator.of(context).pushNamed(RoutePaths.ADD_NEW),
        ),
        SizedBox(
          width: 16,
        )
      ],
    );
  }

  Widget _buildBody(DashboardViewModel model) {
    return screens[model.currentIndex];
  }

  Widget _buildBottomNavigationBar(BuildContext context,
      DashboardViewModel model) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: model.setCurrentIndex,
      currentIndex: model.currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: blackColor87),
      unselectedIconTheme: IconThemeData(color: blackColor54),
      selectedLabelStyle: TextStyle(fontSize: 18, color: blackColor87),
      unselectedLabelStyle: TextStyle(fontSize: 16, color: blackColor87),
      selectedItemColor: blackColor87,
      unselectedItemColor: blackColor54,
    );
  }

  Widget _buildNavigationDrawer(BuildContext context,
      DashboardViewModel model) {
    return Container(
      width: 200,
      color: whiteColor,
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: blackColor54,
              height: 100,
            ),
            ListTile(
              title: Text("Explore"),
              trailing: Icon(Icons.explore),
              selected: model.currentIndex == 0,
              onTap: () {
                model.setCurrentIndex(0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Favorite"),
              trailing: Icon(Icons.favorite_outlined),
              selected: model.currentIndex == 1,
              onTap: () {
                model.setCurrentIndex(1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.person),
              selected: model.currentIndex == 2,
              onTap: () {
                model.setCurrentIndex(2);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("About us"),
              trailing: Icon(Icons.info),
            ),
            ListTile(
              title: Text("Log out"),
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }

  void _listenUserLocation(BuildContext context,
      DashboardViewModel model) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    print("Service enabled $_serviceEnabled");
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        showSnackBar(context,
            "Places needs your location to accurately show places near you");
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    // print("Location permission $_permissionGranted");

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        showSnackBar(
            context, "Places needs  location permission  show places near you");
        return;
      }
    }

    _locationData = await location.getLocation();
    /// store in app state
    model.addUserLocation(_locationData);
    print("The user location $_locationData");
  }
}