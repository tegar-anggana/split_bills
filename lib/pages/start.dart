import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:split_bills/pages/login.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> listPagesViewModel = [
      PageViewModel(
        titleWidget: const Text(
          "Split Bills",
          style: TextStyle(
            color: Color(0xff4F103D),
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        bodyWidget: SizedBox(
          width: 350,
          height: 350,
          child: Image.asset('images/bill.png', fit: BoxFit.contain),
        ),
        footer: const Text(
          "Selamat datang di aplikasi Split Bills",
          style: TextStyle(
            color: Color(0xff4F103D),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      PageViewModel(
        titleWidget: const Text(
          "Friend Paid",
          style: TextStyle(
            color: Color(0xff4F103D),
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        bodyWidget: SizedBox(
          width: 350,
          height: 350,
          child: Image.asset('images/bills.png'),
        ),
        footer: const Text(
          "Memudahkan anda dan teman-teman anda dalam menghitung bills",
          style: TextStyle(
            color: Color(0xff4F103D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IntroductionScreen(
            globalBackgroundColor: Colors.white,
            pages: listPagesViewModel,
            showBackButton: true,
            back: const Icon(Icons.arrow_back, color: Color(0xff4F103D)),
            next: const Icon(Icons.arrow_forward, color: Color(0xff4F103D)),
            done: const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff4F103D),
              ),
            ),
            onDone: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            baseBtnStyle: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            dotsDecorator: const DotsDecorator(
              activeColor: Color(0xff4F103D),
            ),
          ),
        ),
      ),
    );
  }
}
