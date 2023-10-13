import 'package:flutter/material.dart';
import 'package:practical_exam/provider/country_provider.dart';
import 'package:practical_exam/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<CountryProvider>(context,listen: false).getCountry();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('𝒞𝑜𝓊𝓃𝓉𝓇𝓎',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50)),
      ),
    );
  }
}
