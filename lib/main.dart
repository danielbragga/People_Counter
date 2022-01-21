import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 25;

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
      backgroundColor: Colors.white24,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/imags/img_1.png'),
          fit: BoxFit.cover,
        )),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
            color: isFull ? Colors.red : Colors.green,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text(
                isFull ? 'Lotado' : 'Pode Entrar',
                style: TextStyle(
                    fontSize: 30,
                    color: isFull ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w800),
              ),],
            ),
          ),


            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty
                        ? Colors.redAccent.withOpacity(0.2)
                        : Colors.redAccent,
                    fixedSize: const Size(100, 100),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.green.withOpacity(0.2) : Colors.green,
                    fixedSize: const Size(100, 100),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
