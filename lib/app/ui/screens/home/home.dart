import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_care/app/ui/screens/appointment/doctor_appointment.dart';
import 'package:med_care/app/ui/screens/doctor/department.dart';
import '../../themes/colors.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/common_icon_button.dart';
import '../../widgets/common_text.dart';
import '../appointment/appointment.dart';
import '../appointment/show_appointment.dart';
import '../doctor/detail.dart';
import '../doctor/list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      drawer: AppDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.primaryColor,
                height: media.height * 0.12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        CommonIconButton(
                          onTap: () {
                            scaffoldState.currentState!.openDrawer();
                          },
                          icon: Icons.menu,
                          iconSize: 30,
                          iconColor: AppColors.secondaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (100 / 100),
                children: [
                  buildCard(
                      text: "Today Appointment",
                      icon: Icons.calendar_today,
                      onPressed: () {
                        Get.to(()=>ShowAppointment());
                      }),
                  buildCard(
                      text: "Appointment Request",
                      icon: Icons.add_circle_outline,
                      onPressed: () {}),
                  buildCard(
                      text: "Doctor Search",
                      icon: Icons.search,
                      onPressed: () {}),
                  buildCard(
                      text: "Prescription",
                      icon: Icons.file_copy,
                      onPressed: () {}),
                  buildCard(
                      text: "Profile", icon: Icons.person, onPressed: () {}),
                  buildCard(
                      text: "Settings", icon: Icons.settings, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCard(
      {required String text,
      required IconData icon,
      required Function() onPressed}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Color.fromRGBO(0, 0, 0, .5),
            elevation: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.amber[800],
                size: 30,
              ),
              Padding(padding: EdgeInsets.all(5)),
              CommonText(
                  text: text,
                  size: 15,
                  color: AppColors.tertiaryColor,
                  textAlign: TextAlign.center),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
