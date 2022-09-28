import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_care/app/controller/auth/auth.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(() => AuthController.to.loginDetails == null ||
                      AuthController.to.loginDetails == ""
                  ? CircularProgressIndicator()
                  : Container(
                      height: media.height * 0.5,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildContainer(media, text: "User Name"),
                          buildContainer(media, text: "Email"),
                          buildContainer(media, text: "Phone"),
                          buildContainer(media, text: "Address"),
                          CommonButton(
                            text: "Edit",
                            width: media.width * 0.4,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ))
            ],
          ),
          CustomPaint(
            child: Container(
              width: media.width,
              height: media.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildContainer(Size media, {required String text}) {
    return Container(
        height: media.height * 0.07,
        width: media.width,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 0.2))
          ],
        ),
        child: Center(
            child: Row(
          children: [
            SizedBox(width: 20),
            CommonText(
              text: text,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            )
          ],
        )));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xffff8f00);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
