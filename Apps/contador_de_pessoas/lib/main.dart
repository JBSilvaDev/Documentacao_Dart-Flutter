import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      count --;
    });
  }

  void increment() {
    setState(() {
      count ++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style:  const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(padding: const EdgeInsets.all(42),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement, // Referencia ao bool get linha 42
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white, // Referencia ao bool get linha 42
                    fixedSize: const Size(100,100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 32,),
                TextButton(
                  onPressed: isFull ? null : increment, // Referencia ao bool get linha 42
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white, // Referencia ao bool get linha 42
                    fixedSize: const Size(100,100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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

