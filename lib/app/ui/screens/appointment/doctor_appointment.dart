import 'package:flutter/material.dart';
import 'package:med_care/app/ui/themes/colors.dart';
import 'package:med_care/app/ui/themes/constants.dart';

import '../../../controller/appointment/appointment.dart';
import '../../widgets/common_text.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorAppointment extends StatelessWidget {
  const DoctorAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: "Doctor Appointment",
          size: AppConstants.mediumFont,
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.tertiaryColor),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 20),
          children: [
            SizedBox(height: 10),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1.5, color: Colors.blue),
                  )),
                  // child:  DropdownButtonFormField(
                  //   decoration: InputDecoration(
                  //       labelText: "Doctor",
                  //       border: InputBorder.none),
                  //   value: AppointmentController.to.selectedDoctor,
                  //   // items: AppointmentController.to.dropdownDoctorItems,
                  //   // items: AppointmentController.to.dropdownDoctorItems,
                  //   onChanged: (zval) {
                  //     // onchangedDropdownDoctorItem(zval);
                  //   },
                  // ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
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
                      //   String formattedDate =
                      //   DateFormat('yyyy-MM-dd').format(_selectedDay);
                      //   this._date = formattedDate;
                      //
                      //   String getslot = Auth().linkURL +
                      //       'api/getDoctorTimeSlop?doctor_id=' +
                      //       _ddoctor +
                      //       '&date=' +
                      //       formattedDate;
                      //   getDoctorSlot(getslot);
                      // }
                      // );
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
                      // _focusedDay = focusedDay;
                    },
                    // locale: langProvider.locale.languageCode,
                    pageJumpingEnabled: true,
                    pageAnimationEnabled: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Center(child: Text("Available slots")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: (true) ? 180 : 0,
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 1, color: Colors.amber),
                        bottom: BorderSide(width: 1, color: Colors.amber),
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
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextButton(
                                  style: (false)
                                      ? ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.amber[800]),
                                        )
                                      : ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        ),
                                  onPressed: () {},
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      // "${doctorSlotList[index]}",
                                      "Slot",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: (true)
                                              ? Colors.black
                                              : Colors.white,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(width: 1.5, color: Colors.blue),
                      )),
                      child: Theme(
                        data: theme.copyWith(primaryColor: Colors.blue),
                        child: TextFormField(
                          controller: AppointmentController.to.remarks,
                          decoration: InputDecoration(
                              labelText: "remarks",
                              hintText: "Give your remarks",
                              border: InputBorder.none),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'invalid input';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        //   if (_firstclick) {
                        //     _firstclick = false;
                        //     makeAppointment(context);
                        //   }
                        // } else {
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return AlertDialog(
                        //           title: Text(AppLocalizations.of(context)
                        //               .invalid),
                        //           content: Text(
                        //               AppLocalizations.of(context)
                        //                   .pleaseEnterValidInput),
                        //           actions: [
                        //             FlatButton(
                        //               child: Text(
                        //                   AppLocalizations.of(context)
                        //                       .ok),
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //             )
                        //           ],
                        //         );
                        //       });
                        // }
                      },
                      child: CommonText(
                        text: "Save",
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
