import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () =>
        Navigator.pushReplacementNamed(context, "home"));}

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(onPressed: (){}, icon: Icon(Icons.media_bluetooth_on_outlined,size: 100,)),
              SizedBox(height: 10,),
              Text("Media Player App",
                  style: TextStyle(fontSize: 30, color: Colors.blue)),
            ],
          ),
        ),
      );
    }
  }
