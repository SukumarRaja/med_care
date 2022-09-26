import 'package:flutter/material.dart';



class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20),
            children: [
              SizedBox(height: 10),

              Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   child: SearchableDropdown.single(
                    //
                    //     displayClearIcon: false,
                    //     items: doctorDataList.map((item) {
                    //       return new DropdownMenuItem(
                    //         child: Container(
                    //           padding: EdgeInsets.only(top: 15, bottom: 15),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               Container(
                    //                 width: 30,
                    //                 height: 30,
                    //                 child: Image.network(
                    //                     "https://image.flaticon.com/icons/png/512/147/147144.png"),
                    //               ),
                    //               SizedBox(
                    //                 width: 10,
                    //               ),
                    //               Text(item["name"]),
                    //             ],
                    //           ),
                    //         ),
                    //         value: item,
                    //       );
                    //     }).toList(),
                    //     // value: _ddoctor,
                    //     hint: Container(
                    //       padding: EdgeInsets.symmetric(vertical: 15),
                    //       child: Text(
                    //         "Choose a doctor",
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //     searchHint: "Search doctor",
                    //     onChanged: (value) {
                    //       // setState(() {
                    //       //   errordoctorselect = false;
                    //       //   _ddoctor = value["id"];
                    //       //
                    //       //   availableSlot="";
                    //       //
                    //       //
                    //       //
                    //       //   String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                    //       //   this._date = formattedDate;
                    //       //   String getslot = Auth().linkURL +
                    //       //       'api/getDoctorTimeSlop?doctor_id=' +
                    //       //       _ddoctor +
                    //       //       '&date=' +
                    //       //       this._date;
                    //       //   getDoctorSlot(getslot);
                    //       //
                    //       // });
                    //     },
                    //     isExpanded: true,
                    //   ),
                    // ),

                    // (errordoctorselect)
                    //     ? Container(
                    //   padding: EdgeInsets.only(left: 20),
                    //   child: Text(
                    //     " No Doctor selected",
                    //     style: TextStyle(
                    //         color: Colors.red,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // )
                    //     : Container(),



                    // Container(
                    //   padding: EdgeInsets.all(20),
                    //   child: TableCalendar(
                    //     firstDay: DateTime.now(),
                    //     lastDay: DateTime.utc(2030, 3, 14),
                    //     focusedDay: _focusedDay,
                    //     headerStyle: HeaderStyle(
                    //         formatButtonVisible: false, titleCentered: true),
                    //
                    //
                    //     selectedDayPredicate: (day) {
                    //       return isSameDay(_selectedDay, day);
                    //     },
                    //
                    //     onDaySelected: (selectedDay, focusedDay) {
                    //       // setState(() {
                    //       //   _selectedDay = selectedDay;
                    //       //   _focusedDay =
                    //       //       focusedDay;
                    //       //
                    //       //
                    //       //   String formattedDate =
                    //       //   DateFormat('yyyy-MM-dd').format(_selectedDay);
                    //       //   this._date = formattedDate;
                    //       //
                    //       //   String getslot = Auth().linkURL +
                    //       //       'api/getDoctorTimeSlop?doctor_id=' +
                    //       //       _ddoctor +
                    //       //       '&date=' +
                    //       //       formattedDate;
                    //       //   availableSlot = "";
                    //       //   getDoctorSlot(getslot);
                    //       //
                    //       // });
                    //     },
                    //
                    //     calendarFormat: CalendarFormat.twoWeeks,
                    //
                    //     calendarStyle: CalendarStyle(
                    //       defaultTextStyle: TextStyle(
                    //         fontSize: 15,
                    //       ),
                    //       isTodayHighlighted: false,
                    //       cellMargin: EdgeInsets.all(5),
                    //       selectedDecoration: BoxDecoration(
                    //         color: Colors.orange[800].withOpacity(.7),
                    //         shape: BoxShape.circle,
                    //       ),
                    //       selectedTextStyle: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //
                    //     onPageChanged: (focusedDay) {
                    //       _focusedDay = focusedDay;
                    //     },
                    //     locale: langProvider.locale.languageCode,
                    //     pageJumpingEnabled: true,
                    //     pageAnimationEnabled: true,
                    //   ),
                    // ),



                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Center(child: Text("Available slots")),
                      ),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: (true) ? 180 : 0,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 1,
                                    color: Colors.black12
                                ),
                                bottom: BorderSide(
                                    width: 1, color: Colors.black12),
                              )),
                          child: Scrollbar(
                            child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: (50 / 23),
                                ),
                                shrinkWrap: true,
                                primary: false,
                                padding: const EdgeInsets.all(5),
                                physics: ClampingScrollPhysics(),
                                // itemCount: doctorSlotList.length,
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextButton(
                                      // style: (doctorSlotList[index][1] ==
                                      //     true)
                                      //     ? ButtonStyle(
                                      //   backgroundColor:
                                      //   MaterialStateProperty.all(
                                      //       Colors.amber[800]),
                                      // )
                                      //     : ButtonStyle(
                                      //   backgroundColor:
                                      //   MaterialStateProperty.all(
                                      //       Colors.white),
                                      // ),
                                      onPressed: () {
                                        // setState(() {
                                        //   for (var listdatas = 0;listdatas <doctorSlotList.length;listdatas++) {
                                        //     if (doctorSlotList[listdatas][0] !=doctorSlotList[index][0]) {
                                        //       doctorSlotList[listdatas][1] =false;
                                        //     }
                                        //     errordoctorslotselect = false;
                                        //   }
                                        //   doctorSlotList[index][1] = true;
                                        //   availableSlot = doctorSlotList[index][0];
                                        //
                                        //
                                        // });
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                              // "${doctorSlotList[index][0]}",
                                              "name",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  // color: (!doctorSlotList[index]
                                                  // [1])
                                                  //     ? Colors.black
                                                  //     : Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                    // (errordoctorslotselect)
                    //     ? Container(
                    //   padding: EdgeInsets.only(left: 20),
                    //   child: Text(
                    //     " No Slot selected",
                    //     style: TextStyle(
                    //         color: Colors.red,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // )
                    //     : Container(),



                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.5, color: Colors.blue),
                              )),
                          child: Theme(
                            data: theme.copyWith(primaryColor: Colors.blue),
                            child: TextFormField(
                              // controller: remarks,
                              decoration: InputDecoration(
                                  labelText:
                                "remarks",
                                  hintText: "give",
                                  border: InputBorder.none),
                              validator: (value) {
                                // if (value.isEmpty) {
                                //   return AppLocalizations.of(context)
                                //       .invalidInput;
                                // }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),



                    Container(
                      width: double.infinity,

                      child: ElevatedButton(
                        onPressed: () {


                          // if (_formKey.currentState.validate()) {
                          //   if (_ddoctor == "" || _ddoctor == null) {
                          //
                          //     setState(() {
                          //       errordoctorselect = true;
                          //     });
                          //   } else if (availableSlot == "" ||
                          //       availableSlot == null) {
                          //
                          //     setState(() {
                          //       errordoctorslotselect = true;
                          //     });
                          //   } else {
                          //
                          //     makeAppointment(context);
                          //
                          //   }
                          // }

                        },
                        child: Text("Save"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
