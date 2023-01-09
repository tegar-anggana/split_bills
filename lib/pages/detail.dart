import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:split_bills/currency_format.dart';
import 'package:split_bills/pages/dashboard.dart';

class Detail extends StatelessWidget {
  const Detail(
      {super.key,
      required this.tanggal,
      required this.deskripsi,
      required this.totalHarga,
      required this.totalOrang});
  final String tanggal;
  final String deskripsi;
  final String totalHarga;
  final String totalOrang;

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
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Text(
                            "Confirm new split bill!",
                            style: TextStyle(
                              color: Color(0xffFAB786),
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            color: const Color(0xffFAB786),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tanggal,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4F103D),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: const [
                      //     Text(
                      //       "Name : ",
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         color: Color(0xff4F103D),
                      //       ),
                      //     ),
                      //     Text(
                      //       "Vinna Alfiati",
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //         color: Color(0xff4F103D),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Description : ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4F103D),
                            ),
                          ),
                          Text(
                            deskripsi,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4F103D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Price : ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4F103D),
                            ),
                          ),
                          Text(
                            CurrencyFormat.convertToIdr(
                                double.tryParse(totalHarga), 2),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4F103D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total People : ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4F103D),
                            ),
                          ),
                          Text(
                            "${int.tryParse(totalOrang)} People",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4F103D),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Price per person : ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff4F103D),
                            ),
                          ),
                          Text(
                            CurrencyFormat.convertToIdr(
                                double.tryParse(totalHarga)! /
                                    double.tryParse(totalOrang)!,
                                2),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4F103D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Are you sure?'),
                                    content: const Text(
                                        'Your bill will be saved and stored in database'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('split_bills')
                                              .add({
                                            "deskripsi": deskripsi,
                                            "tanggal": tanggal,
                                            "total_harga":
                                                double.tryParse(totalHarga),
                                            "total_orang":
                                                int.tryParse(totalOrang),
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Your bill has been saved"),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Dashboard(),
                                            ),
                                            ModalRoute.withName('/'),
                                          );
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff4F103D),
                              ),
                              child: const Text(
                                "Confirm",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
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
