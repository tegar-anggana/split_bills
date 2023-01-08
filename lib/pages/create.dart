import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_bills/pages/detail.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String date = "";

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController =
        TextEditingController(text: date);
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
                            "Create new split bill!",
                            style: TextStyle(
                              color: Color(0xffFAB786),
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        autofocus: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: Color(0xff4F103D),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFFEFEF),
                          labelText: "Bill Description",
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
                      const SizedBox(height: 20),
                      const TextField(
                        autofocus: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: Color(0xff4F103D),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFFEFEF),
                          labelText: "Total Price",
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
                      const SizedBox(height: 20),
                      const TextField(
                        autofocus: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: Color(0xff4F103D),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFFEFEF),
                          labelText: "Total People",
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
                      const SizedBox(height: 20),
                      TextField(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          ).then(
                            (value) {
                              if (value != null) {
                                setState(() {
                                  date = DateFormat.yMMMEd().format(value);
                                });
                              }
                            },
                          );
                        },
                        autofocus: false,
                        autocorrect: false,
                        showCursor: false,
                        keyboardType: TextInputType.none,
                        controller: dateController,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff4F103D),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFFEFEF),
                          labelText: "Date",
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Detail(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff4F103D),
                              ),
                              child: const Text(
                                "Next",
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
