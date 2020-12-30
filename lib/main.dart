import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_tab.dart';
import 'news_tab.dart';
import 'profile_tab.dart';
import 'settings_tab.dart';
import 'songs_tab.dart';
import 'widgets.dart';

void main() => runApp(MyAdaptingApp());

class MyAdaptingApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Adaptive Music App',
      theme: ThemeData(
        // Use the green theme for Material widgets.
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(

          data: CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: PlatformAdaptingHomePage(),
    );
  }
}

class PlatformAdaptingHomePage extends StatefulWidget {
  @override
  _PlatformAdaptingHomePageState createState() =>
      _PlatformAdaptingHomePageState();
}

class _PlatformAdaptingHomePageState extends State<PlatformAdaptingHomePage> {

  final songsTabKey = GlobalKey();

  Widget _buildAndroidHomePage(BuildContext context) {
    return SongsTab(
      key: songsTabKey,
      androidDrawer: _AndroidDrawer(),
    );
  }

  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
           // label: SongsTab.title,
            icon: SongsTab.iosIcon,
          ),
          BottomNavigationBarItem(
           // label: NewsTab.title,
            icon: NewsTab.iosIcon,
          ),
          BottomNavigationBarItem(
            //label: ProfileTab.title,
            icon: ProfileTab.iosIcon,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: SongsTab.title,
              builder: (context) => SongsTab(key: songsTabKey),
            );
          case 1:
            return CupertinoTabView(
              defaultTitle: NewsTab.title,
              builder: (context) => NewsTab(),
            );
          case 2:
            return CupertinoTabView(
              defaultTitle: ProfileTab.title,
              builder: (context) => ProfileTab(),
            );
          case 3 :
            return CupertinoTabView(
            defaultTitle: MyApp.title,
            builder: (context) => MyApp(),
          );

          default:
            assert(false, 'Unexpected tab');
            return null;
        }
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: SongsTab.androidIcon,
            title: Text(SongsTab.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NewsTab.androidIcon,
            title: Text(NewsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context, MaterialPageRoute(builder: (context) => NewsTab()));
            },
          ),
          ListTile(
            leading: MyApp.androidIcon,
            title: Text(MyApp.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: ProfileTab.androidIcon,
            title: Text(ProfileTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => ProfileTab()));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: SettingsTab.androidIcon,
            title: Text(SettingsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => SettingsTab()));
            },
          ),
        ],
      ),
    );
  }
}
