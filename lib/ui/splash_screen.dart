import 'package:chef_application/ui/Dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/salad.png', width: 300, height: 440),
            const Text(
              '30k+ premium recipes',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 248, 158, 161)),
            ),
            const SizedBox(height: 15),
            const Text('Cook like\na chef',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 18),
            ElevatedButton(
                onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard()));},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 52),
                  backgroundColor: const Color.fromARGB(255, 249, 97, 99),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ))
          ],
        ),
      ),
    );
  }
}
