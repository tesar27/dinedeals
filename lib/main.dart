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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoTaste',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // Replaced BottomNav with HomePage
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
