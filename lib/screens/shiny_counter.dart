import 'package:flutter/material.dart';
import 'package:shiny_hunter/services/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    counter = UsersSharedPreferences.getCounter() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        const Text(
          'Attempts at current shiny',
        ),
        Text(
          '$counter',
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
                    if (counter > 0) {
                      setState(() {
                        counter--;
                      });
                      await UsersSharedPreferences.changeCounter(counter);
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
                    counter++;
                  });
                  await UsersSharedPreferences.changeCounter(counter);
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
  }
}
