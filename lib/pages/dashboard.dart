import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:split_bills/currency_format.dart';
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 38,
                            child: Image.asset('images/logo.png'),
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
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('split_bills')
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasData) {
                                        List billsList = [];
                                        for (var bill in snapshot.data!.docs) {
                                          billsList.add(bill.data());
                                        }
                                        double totalBill = 0;
                                        double totalYourSpending = 0;

                                        for (var data in billsList) {
                                          totalBill =
                                              (totalBill + data['total_harga']);
                                          totalYourSpending =
                                              (totalYourSpending +
                                                  (data['total_harga'] /
                                                      data['total_orang']));
                                        }
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Total Bill : ",
                                                  style: TextStyle(
                                                    color: Color(0xffFAB786),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  CurrencyFormat.convertToIdr(
                                                      totalBill, 0),
                                                  style: const TextStyle(
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
                                              children: [
                                                const Text(
                                                  "Your Total Spending : ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  CurrencyFormat.convertToIdr(
                                                      totalYourSpending, 0),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Text('');
                                      }
                                    }),
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
                          child: Column(
                            children: [
                              Expanded(
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('split_bills')
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot>
                                            streamSnapshot) {
                                      if (streamSnapshot.hasData) {
                                        return ListView.builder(
                                            itemCount: streamSnapshot
                                                .data!.docs.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final DocumentSnapshot
                                                  documentSnapshot =
                                                  streamSnapshot
                                                      .data!.docs[index];
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 10),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 7,
                                                    vertical: 8,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        documentSnapshot[
                                                            'tanggal'],
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff4F103D),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        documentSnapshot[
                                                            'deskripsi'],
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff4F103D),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "Total bills :",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff4F103D),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                          Text(
                                                            CurrencyFormat.convertToIdr(
                                                                documentSnapshot[
                                                                    'total_harga'],
                                                                0),
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xff4F103D),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "People : ",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff4F103D),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${documentSnapshot['total_orang']} People",
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xff4F103D),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "You must pay : ",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff4F103D),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                          Text(
                                                            CurrencyFormat.convertToIdr(
                                                                documentSnapshot[
                                                                        'total_harga'] /
                                                                    documentSnapshot[
                                                                        'total_orang'],
                                                                0),
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xff4F103D),
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      } else {
                                        return const Text('');
                                      }
                                    }),
                              ),
                              const SizedBox(height: 10),
                            ],
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
