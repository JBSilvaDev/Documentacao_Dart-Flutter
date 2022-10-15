import 'package:app_rascunhos/api_dio/services/prefs_services.dart';
import 'package:flutter/material.dart';

class SplashPageApi extends StatefulWidget {
  const SplashPageApi({Key? key}) : super(key: key);

  @override
  State<SplashPageApi> createState() => _SplashPageApiState();
}

class _SplashPageApiState extends State<SplashPageApi> {
  @override
  void initState() {
    Future.wait([
      PrefsServices.isAuth(),
      Future.delayed(const Duration(seconds: 1))
    ]).then((value) {
      value[0]
          ? Navigator.pushReplacementNamed(context, '/homeloginapi')
          : Navigator.pushReplacementNamed(context, '/loginapi');
    });

    // Future.delayed(const Duration(seconds: 1))
    //     .then((value) => Navigator.pushReplacementNamed(context, '/loginapi'));
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
