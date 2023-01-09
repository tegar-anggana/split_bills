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
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController totalPeopleController = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final TextEditingController dateController =
    //     TextEditingController(text: date);
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
                      TextField(
                        controller: deskripsiController,
                        autofocus: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff4F103D),
                        decoration: const InputDecoration(
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
                      TextField(
                        controller: totalPriceController,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff4F103D),
                        decoration: const InputDecoration(
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
                      TextField(
                        controller: totalPeopleController,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff4F103D),
                        decoration: const InputDecoration(
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
                            lastDate: DateTime(2100),
                          ).then(
                            (value) {
                              if (value != null) {
                                String formattedDate =
                                    DateFormat("d MMMM yyyy", "id_ID")
                                        .format(value);
                                setState(() {
                                  // date = DateFormat.yMMMEd().format(value);
                                  dateInput.text = formattedDate;
                                });
                              }
                            },
                          );
                        },
                        autofocus: false,
                        autocorrect: false,
                        showCursor: false,
                        keyboardType: TextInputType.none,
                        controller: dateInput,
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
                                    builder: (context) => Detail(
                                      tanggal: dateInput.text,
                                      deskripsi: deskripsiController.text,
                                      totalHarga: totalPriceController.text,
                                      totalOrang: totalPeopleController.text,
                                    ),
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
