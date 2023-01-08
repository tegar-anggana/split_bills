import 'package:flutter/material.dart';
import 'package:split_bills/pages/create.dart';
import 'package:split_bills/pages/login.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 38,
                            child: Image.asset('images/logo.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "Hi Vinna!",
                                  style: TextStyle(
                                    color: Color(0xff4F103D),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: CircleAvatar(
                                              radius: 60,
                                              child: Image.asset(
                                                  'images/profile.png'),
                                            ),
                                            content: SizedBox(
                                              height: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Vinna Alfiati",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text("Back"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  "Logout Success"),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                            ),
                                                          );
                                                          Navigator.of(context)
                                                              .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const Login(),
                                                            ),
                                                            ModalRoute.withName(
                                                                '/'),
                                                          );
                                                        },
                                                        child: const Text(
                                                          "Logout",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.account_circle,
                                    size: 50,
                                    color: Color.fromARGB(255, 255, 185, 185),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Create(),
                                ),
                              );
                            },
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add_circle,
                              size: 40,
                              color: Color(0xff4F103D),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Create new split bill",
                            style: TextStyle(
                              color: Color(0xffFAB786),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xff4F103D),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Total Bill : ",
                                          style: TextStyle(
                                            color: Color(0xffFAB786),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Rp 750.000",
                                          style: TextStyle(
                                            color: Color(0xffFAB786),
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Your Total Spending : ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Rp 750.000",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.white,
                                    child: Image.asset('images/bills.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            "History",
                            style: TextStyle(
                              color: Color(0xff4F103D),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          color: const Color(0xff4F103D),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "23 November 2022",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Makan di ubertos",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Total bills : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 75.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "People : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "5 People",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "You must pay : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 15.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "23 November 2022",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Makan di ubertos",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Total bills : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 75.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "People : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "5 People",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "You must pay : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 15.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "23 November 2022",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Makan di ubertos",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Total bills : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 75.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "People : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "5 People",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "You must pay : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 15.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "23 November 2022",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Makan di ubertos",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Total bills : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 75.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "People : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "5 People",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "You must pay : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 15.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "23 November 2022",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Makan di ubertos",
                                          style: TextStyle(
                                            color: Color(0xff4F103D),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Total bills : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 75.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "People : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "5 People",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "You must pay : ",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "Rp 15.000",
                                              style: TextStyle(
                                                color: Color(0xff4F103D),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
