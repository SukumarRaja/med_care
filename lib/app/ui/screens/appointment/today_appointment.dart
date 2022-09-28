import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:med_care/app/ui/themes/colors.dart';
import 'package:med_care/app/ui/themes/constants.dart';
import 'package:med_care/app/ui/widgets/common_text.dart';

import '../../../controller/appointment/appointment.dart';
import '../../../utils/appointment_status_color.dart';
import '../../widgets/no_data.dart';
import '../../widgets/no_service.dart';
import '../../widgets/simpe_loading.dart';
import '../../widgets/today_appointment_card.dart';

class TodayAppointment extends StatelessWidget {
  const TodayAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppointmentController.to.getTodayAppointment();
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: "Today Appointment",
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
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 1, blurRadius: 2)
                    ]),
                width: double.infinity,
                child: TextFormField(
                  controller: AppointmentController.to.searchAppointment,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "search by name",
                    hintText: "doctor",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Icon(Icons.search),
                    ),
                  ),
                  onChanged: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => AppointmentController.to.appointmentLoading == true
                ? SimpleLoading()
                : AppointmentController.to.getAppointmentError == true
                    ? ServerError(
                        emptyMsg:
                            "Error from server or no internet please try again later")
                    : AppointmentController.to.appointmentEmpty == true
                        ? NoData(emptyMsg: "Today no appointments yet")
                : ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return TodayAppointmentCard(
                        doctorName: "hkjhkj",
                        remarks: "jkljlk",
                        date: "kljlkj",
                        startTime: "k;lk;l",
                        endTime: "lkjlkj",
                        status: "kl;k;l",
                        statusColor: getAppointmentColors(status: "Confirmed"),
                        onPressed: () {},
                        videoCallPressed: () {},
                      );
                    }),
          )
        ],
      ),
    );
  }
}
