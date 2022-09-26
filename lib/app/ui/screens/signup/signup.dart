import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/auth.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_text_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 225, 1).withOpacity(0.3),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                alignment: Alignment.center,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 5, left: 30, right: 30),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset("assets/icon/loginicon.png"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      // width: deviceSize.width * 0.85,
                      padding: EdgeInsets.all(8.0),
                      // child: AuthCard(),
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CommonTextFormField(
                                hintText: "Email",
                                maxLines: 1,
                                obscureText: false,
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                              ),
                              CommonTextFormField(
                                hintText: "Password",
                                obscureText: true,
                                maxLines: 1,
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return 'Please Enter Password';
                                  } else if (data.length < 8) {
                                    return 'Password Should Be 8';
                                  }
                                  return null;
                                },
                              ),
                              CommonTextFormField(
                                hintText: "Confirm Password",
                                obscureText: true,
                                maxLines: 1,
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return 'Please Enter Password';
                                  } else if (data.length < 8) {
                                    return 'Password Should Be 8';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CommonButton(
                                text: "SignUp",
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: CommonText(text: "Already have an account SignIn ?",)),

                              Obx(() => AuthController.to.loginLoading == true
                                  ? Center(child: CircularProgressIndicator())
                                  : const SizedBox()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
