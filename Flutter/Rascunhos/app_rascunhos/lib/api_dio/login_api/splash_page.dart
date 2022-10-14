import 'package:flutter/material.dart';

class SplashPageApi extends StatefulWidget {
  const SplashPageApi({Key? key}) : super(key: key);

  @override
  State<SplashPageApi> createState() => _SplashPageApiState();
}

class _SplashPageApiState extends State<SplashPageApi> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => Navigator.pushReplacementNamed(context, '/loginapi'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade700,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),
    );
  }
}
