// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'screens/discover.dart';
import 'screens/profile.dart';
import 'widgets/floating_bottom_nav.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // Add observer
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // App paused (backgrounded) - save global state here
      print('App paused');
    } else if (state == AppLifecycleState.resumed) {
      // App resumed (foregrounded) - load global state here
      print('App resumed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DineDeals',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    _pageController = PageController(initialPage: appProvider.currentIndex);
  }

  void _onNavTap(BuildContext context, int index) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.setIndex(index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) => appProvider.setIndex(index),
                physics: const NeverScrollableScrollPhysics(),
                children: const [DiscoverPage(), ProfilePage()],
              ),
              FloatingBottomNav(
                currentIndex: appProvider.currentIndex,
                onTap: (index) => _onNavTap(context, index),
              ),
            ],
          ),
        );
      },
    );
  }
}
