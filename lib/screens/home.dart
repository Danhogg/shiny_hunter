import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiny_hunter/screens/setup.dart';
import 'package:shiny_hunter/screens/shiny_counter.dart';
import 'package:shiny_hunter/services/theme_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List _screens = [const HomeScreen(), const SetupScreen()];
  final List titles = ["Shiny Counter", "Setup shiny counter"];

  @override
  void initState() {
    super.initState();
  }

  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        centerTitle: true,
        leading: Consumer<ThemeProvider>(
          builder: (context, notifier, child) {
            return IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                notifier.swapTheme();
              },
            );
          },
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Counter'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        onTap: onTabPressed,
      ),
    );
  }
}
