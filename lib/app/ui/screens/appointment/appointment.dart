import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_care/app/controller/doctor/doctor.dart';
import 'package:med_care/app/ui/widgets/common_button.dart';
import '../../themes/colors.dart';
import '../../themes/constants.dart';
import '../../widgets/common_text.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var media = MediaQuery.of(context).size;
    DoctorController.to.getDoctorList();

    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: "Appointment",
          size: AppConstants.mediumFont,
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.tertiaryColor,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: Container(
          child: ListView(
        children: [
          Form(
              child: Column(
            children: [
              Container(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: DatePicker(
                      DateTime.now(),
                      // controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: AppColors.primaryColor,
                      selectedTextColor: AppColors.secondaryColor,
                      onDateChange: (date) {
                        // New date selected
                        // setState(() {
                        //   _selectedValue = date;
                        // });
                      },
                    ),
                  ),
                ],
              ),
              Obx(
                () => DoctorController.to.doctorSelectedEmpty == false
                    ? Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          " No Doctor selected",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
              ),
              buildPadding(media, text: "AVAILABLE SLOT"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: (true) ? 180 : 0,
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(width: 1, color: Colors.black12),
                      bottom: BorderSide(width: 1, color: Colors.black12),
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
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.primaryColor),
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   for (var listdatas = 0;
                                  //   listdatas <
                                  //       doctorSlotList.length;
                                  //   listdatas++) {
                                  //     if (doctorSlotList[listdatas]
                                  //     [0] !=
                                  //         doctorSlotList[index][0]) {
                                  //       doctorSlotList[listdatas][1] =
                                  //       false;
                                  //     }
                                  //     errordoctorslotselect = false;
                                  //   }
                                  //   doctorSlotList[index][1] = true;
                                  //   availableSlot =
                                  //   doctorSlotList[index][0];
                                  // });
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "${DoctorController.to.doctorDetails[index].name}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
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
              Obx(() => DoctorController.to.slotSelectedEmpty == false
                  ? Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        " No Slot selected",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container()),
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
                        // controller: _remarks,
                        decoration: InputDecoration(
                            labelText: "remarks",
                            hintText: "give",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "invalid input";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              CommonButton(text: "Book", onPressed: () {})
            ],
          ))
        ],
      )),
    );
  }

  Padding buildPadding(Size media, {required text}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: media.width * 0.05, vertical: media.height * 0.01),
      child: CommonText(
        text: text,
        color: AppColors.primaryColor,
      ),
    );
  }
}
