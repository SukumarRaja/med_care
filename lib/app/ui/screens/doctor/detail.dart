import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../controller/appointment/appointment.dart';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool length = false;
    bool selectSlot = false;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                        color: Colors.black45,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                            "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?size=338&ext=jpg")),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width * .5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Department",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "phone",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Text(
                              "Profile:",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Divider(color: Colors.amber[800]),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  // key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: TableCalendar(
                          firstDay: DateTime.now(),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: AppointmentController.to.focusedDay,
                          headerStyle: HeaderStyle(
                              formatButtonVisible: false, titleCentered: true),

                          selectedDayPredicate: (day) {
                            return isSameDay(
                                AppointmentController.to.selectedDay, day);
                          },

                          onDaySelected: (selectedDay, focusedDay) {
                            // setState(() {
                            //   _selectedDay = selectedDay;
                            //   _focusedDay = focusedDay;
                            //
                            //
                            //   availableSlot = "";
                            //
                            //   String formattedDate =
                            //   DateFormat('yyyy-MM-dd')
                            //       .format(_selectedDay);
                            //   this._date = formattedDate;
                            //
                            //
                            //   String getslot = Auth().linkURL +
                            //       'api/getDoctorTimeSlop?doctor_id=' +
                            //       _doctoruserid.text +
                            //       '&date=' +
                            //       formattedDate;
                            //   getDoctorSlot(getslot);
                            //
                            // });
                          },

                          calendarFormat: CalendarFormat.twoWeeks,

                          calendarStyle: CalendarStyle(
                            defaultTextStyle: TextStyle(
                              fontSize: 15,
                            ),
                            isTodayHighlighted: false,
                            cellMargin: EdgeInsets.all(5),
                            selectedDecoration: BoxDecoration(
                              color: Colors.orange.withOpacity(.7),
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onPageChanged: (focusedDay) {
                            AppointmentController.to.focusedDay = focusedDay;
                          },
                          // locale: langProvider.locale.languageCode,
                          pageJumpingEnabled: true,
                          pageAnimationEnabled: true,
                        ),
                      ),

                      SizedBox(height: 20),

                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            // height:
                            // (doctorSlotList.length > 0) ? 180 : 50,
                            height: 50,

                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(width: 1, color: Colors.amber),
                              bottom: BorderSide(width: 1, color: Colors.amber),
                            )),

                            child: Scrollbar(
                              child:
                                  // (doctorSlotList.length >= 1)
                                  length == true
                                      ? GridView.builder(
                                          scrollDirection: Axis.horizontal,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                            childAspectRatio: (50 / 120),
                                          ),
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: const EdgeInsets.all(5),
                                          physics: ClampingScrollPhysics(),
                                          // itemCount: doctorSlotList.length,
                                          itemCount: 5,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextButton(
                                                // style: (doctorSlotList[index]
                                                // [1] ==
                                                //     true)
                                                //     ? ButtonStyle(
                                                //   backgroundColor:
                                                //   MaterialStateProperty
                                                //       .all(Colors
                                                //       .amber[
                                                //   800]),
                                                // )
                                                //     : ButtonStyle(
                                                //   backgroundColor:
                                                //   MaterialStateProperty
                                                //       .all(Colors
                                                //       .white),
                                                // ),
                                                onPressed: () {
                                                  // setState(() {
                                                  //   for (var listdatas = 0;
                                                  //   listdatas <
                                                  //       doctorSlotList
                                                  //           .length;
                                                  //   listdatas++) {
                                                  //     if (doctorSlotList[
                                                  //     listdatas][0] !=
                                                  //         doctorSlotList[
                                                  //         index][0]) {
                                                  //       doctorSlotList[
                                                  //       listdatas]
                                                  //       [1] = false;
                                                  //     }
                                                  //   }
                                                  //   doctorSlotList[index][1] =
                                                  //   true;
                                                  //   availableSlot =
                                                  //   doctorSlotList[index]
                                                  //   [0];
                                                  //
                                                  //   errordoctorslotselect=false;
                                                  //
                                                  //
                                                  // });
                                                },
                                                child: Container(
                                                  child: Center(
                                                      child: Text(
                                                    // "${doctorSlotList[index][0]}",
                                                    "slot",
                                                    // style: TextStyle(
                                                    //     fontSize: 13,
                                                    //     color:
                                                    //     (!doctorSlotList[
                                                    //     index][1])
                                                    //         ? Colors.black
                                                    //         : Colors
                                                    //         .white,
                                                    //     fontWeight:
                                                    //     FontWeight.bold),
                                                  )),
                                                ),
                                              ),
                                            );
                                          })
                                      : Container(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Text("no slots"),
                                        ),
                            ),
                          ),
                        ),
                      ),
                      // (errordoctorslotselect)
                      selectSlot == false
                          ? Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                " No Slot selected",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container(),

                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Theme(
                              data: theme.copyWith(
                                primaryColor: Colors.amber,
                                backgroundColor: Colors.amber,
                              ),
                              child: TextFormField(
                                controller: AppointmentController.to.remarks,
                                decoration: InputDecoration(
                                  labelText: "remarks",
                                  labelStyle: TextStyle(
                                    color: Colors.amber[800],
                                  ),
                                  hintText: "give your remarks",
                                  border: const UnderlineInputBorder(),
                                ),
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
                      //
                      Container(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.amber[800])),
                            onPressed: () {
                              // if (_formKey.currentState.validate()) {
                              //   if (_formKey.currentState.validate()) {
                              //     if (availableSlot == "" ||
                              //         availableSlot == null) {
                              //       setState(() {
                              //         errordoctorslotselect = true;
                              //       });
                              //     } else {
                              //       makeAppointment(context);
                              //     }
                              //   }
                              // }
                            },
                            child: Text("request"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
