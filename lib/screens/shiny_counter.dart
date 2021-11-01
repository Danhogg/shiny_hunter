import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiny_hunter/services/counter_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ChangeNotifier {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Consumer<CounterProvider>(
          builder: (context, CounterProvider notifier, child) {
        return Column(
          children: <Widget>[
            const Text(
              'Attempts at current shiny',
            ),
            Text(
              '${notifier.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: ElevatedButton(
                      child: const Icon(Icons.remove),
                      onPressed: () async {
                        if (notifier.counter > 0) {
                          setState(() {
                            notifier.minusOne();
                          });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffe70808)))),
                ),
                SizedBox(width: size.width * 0.1),
                SizedBox(
                  width: size.width * 0.4,
                  child: ElevatedButton(
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      setState(() {
                        notifier.addOne();
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff08f40e))),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
