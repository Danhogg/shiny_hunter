import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int counter = 0;
  @override
  void initState() {
    super.initState();
    counter;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
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
                  onPressed: () {
                    if (counter > 0) {
                      setState(() {
                        counter--;
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
                onPressed: () {
                  setState(() {
                    counter++;
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
  }
}
