import 'package:flutter/material.dart';
import 'package:lets_chat/features/app/theme/style.dart';
import 'package:lets_chat/features/user/presentation/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(child: Text("Welcome to Let's Chat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: whiteColor),),),
            Image.asset("assets/app_logo.png"),
            Column(
              children: [
                const Text("Read our Privacy Policy Tap, 'Agree and Continue' to accept the Team of Service.", textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text("AGREE AND CONTINUE", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );;
  }
}
