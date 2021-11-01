import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiny_hunter/screens/home.dart';
import 'package:shiny_hunter/services/theme_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {
          return GestureDetector(
              onTap: () {
                // Dismiss keyboard throughout app
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: notifier.darktheme
                    ? notifier.darkTheme
                    : notifier.lightTheme,
                home: const MyHomePage(),
              ));
        },
      ),
    );
  }
}
