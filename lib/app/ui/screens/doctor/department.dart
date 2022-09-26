import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_care/app/ui/themes/colors.dart';

import '../../widgets/app_drawer.dart';
import '../../widgets/common_icon_button.dart';
import '../../widgets/common_text.dart';

class DoctorDepartment extends StatelessWidget {
   DoctorDepartment({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldState,
      drawer: AppDrawer(),
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 25,
              right: 25,
            ),
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextFormField(
                  // controller: _searchdepartment,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "search department",
                    hintText: "department",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Icon(Icons.search),
                    ),
                  ),
                  onChanged: (value) {
                    // searchDepartment(value);

                    return null;
                  },
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*.5,
            child: Center(
              child: Text("no data"),
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: (50 / 45),
                ),
                shrinkWrap: true,
                primary: false,
                physics: ClampingScrollPhysics(),
                // itemCount: _tempdepartment.length,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  Color statusColor;

                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        shadowColor: Color.fromRGBO(0, 0, 0, .5),
                        elevation: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.amber[800],
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              // "${_tempdepartment[index].name}",
                              "name",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DoctorListScreen(
                        //             idd, useridd,
                        //             departmentname:
                        //             _tempdepartment[index].id)));
                      },
                    ),
                  );
                }),
          )


        ],
      ),

    );
  }
}
