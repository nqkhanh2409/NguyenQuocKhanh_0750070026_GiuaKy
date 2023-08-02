// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum TabItem { home, favorite, notification, account }

class _MainPageState extends State<MainPage> {
  TabItem _currentItem = TabItem.home;

  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.favorite,
    TabItem.notification,
    TabItem.account,
  ];

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];
    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 0)
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _bottomTabs
                .map((tabItem) => _bottomNavigationBarItem(tabItem))
                .toList(),
            onTap: _onSelectTab,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
          ),
        ),
      ),
      body: SafeArea(child: _buildPage()),
    );
  }



  BottomNavigationBarItem _bottomNavigationBarItem(TabItem tabItem) {
    Color color = _currentItem == tabItem ? Colors.green : Colors.grey.shade400;

    IconData _icon(TabItem item) {
      switch (item) {
        case TabItem.home:
          return Icons.home_rounded;
        case TabItem.favorite:
          return Icons.favorite;
        case TabItem.notification:
          return Icons.notifications;
        case TabItem.account:
          return Icons.person;
        default:
          throw 'Unknown $item';
      }
    }

    return BottomNavigationBarItem(
      icon: Icon(_icon(tabItem), color: color, size: 40),
      label: '');
  }

  Widget _buildPage() {
    switch (_currentItem) {
      case TabItem.home:
        return const HomePage();
      case TabItem.favorite:
        return Container(child: const Center(child: Text('Favorite Page')));
      case TabItem.notification:
        return Container(child: const Center(child: Text('Notification Page')));
      case TabItem.account:
        return Container(child: const Center(child: Text('Account Page')));
      default:
        return const HomePage();
    }
  }
}
