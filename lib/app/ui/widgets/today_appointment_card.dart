import 'package:flutter/material.dart';
import 'package:med_care/app/ui/themes/colors.dart';
import 'package:med_care/app/ui/themes/constants.dart';
import 'package:med_care/app/ui/widgets/common_text.dart';

class TodayAppointmentCard extends StatelessWidget {
  const TodayAppointmentCard(
      {Key? key,
      required this.doctorName,
      required this.remarks,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.statusColor,
      required this.status,
      required this.videoCallPressed,
      required this.onPressed})
      : super(key: key);
  final String doctorName;
  final String remarks;
  final String date;
  final String status;
  final String startTime;
  final String endTime;
  final Color statusColor;
  final Function() videoCallPressed;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  width: MediaQuery.of(context).size.width * .25,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: videoCallPressed,
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 2))
                        ]),
                    child: Center(
                      child: Icon(
                        Icons.video_call_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: doctorName,
                  overFlow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  size: AppConstants.mediumFont,
                  color: Colors.black54,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.event_note,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CommonText(
                      text: "Remarks: $remarks",
                      overFlow: TextOverflow.ellipsis,
                      size: AppConstants.smallFont,
                      color: Colors.black54,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.event,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CommonText(
                      text: date,
                      overFlow: TextOverflow.ellipsis,
                      size: AppConstants.smallFont,
                      color: Colors.black54,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.access_time_sharp,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CommonText(
                      text: "$startTime - $endTime",
                      overFlow: TextOverflow.ellipsis,
                      size: AppConstants.smallFont,
                      color: Colors.black54,
                    ),
                  ],
                ),
                CommonText(
                  text: status,
                  fontWeight: FontWeight.bold,
                  size: AppConstants.smallFont,
                  color: statusColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
