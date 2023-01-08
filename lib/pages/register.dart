import 'package:flutter/material.dart';
import 'package:split_bills/pages/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/logo.png'),
                          // const SizedBox(height: 20),
                          Column(
                            children: const [
                              TextField(
                                autofocus: false,
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                cursorColor: Color(0xff4F103D),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffFFEFEF),
                                  labelText: "Email",
                                  floatingLabelStyle: TextStyle(
                                    color: Color(0xff4F103D),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xff4F103D),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                autofocus: false,
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                cursorColor: Color(0xff4F103D),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffFFEFEF),
                                  labelText: "Username",
                                  floatingLabelStyle: TextStyle(
                                    color: Color(0xff4F103D),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xff4F103D),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                autofocus: false,
                                autocorrect: false,
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                cursorColor: Color(0xff4F103D),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffFFEFEF),
                                  labelText: "Password",
                                  floatingLabelStyle: TextStyle(
                                    color: Color(0xff4F103D),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xff4F103D),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              SizedBox(
                                width: 110,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff4F103D),
                                  ),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: Color(0xff4F103D),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Login"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
