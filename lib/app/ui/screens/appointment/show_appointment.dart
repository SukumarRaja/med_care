import 'package:flutter/material.dart';
import 'package:med_care/app/ui/widgets/common_text.dart';

import '../../themes/colors.dart';

class ShowAppointment extends StatelessWidget {
  const ShowAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {},
          )
        ],
        title: CommonText(
          text: "Appointment List",
          // AppLocalizations.of(context).appointmentList,
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.tertiaryColor),
      ),
    );
  }
}
