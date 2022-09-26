import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // controller: _searchdoctor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "search",
                    hintText: "doctor",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Icon(Icons.search),
                    ),
                  ),
                  onChanged: (value) {
                    // searchDoctorList(value);

                    return null;
                  },
                ),
              ),
            ),
          ),
          // Container(
          //     height: MediaQuery.of(context).size.height * .5,
          //     child: Center(child: CircularProgressIndicator())),
          // Container(
          //   height: MediaQuery.of(context).size.height * .5,
          //   child: Center(
          //     child:
          //     Text("No data"),
          //   ),
          //
          // ),
          Container(
            padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: (100 / 145),
                ),
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(5),
                physics: ClampingScrollPhysics(),
                // itemCount: _tempdoctorlistdata.length,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.amber
                                    .withOpacity(.15),
                                offset: Offset(0, 3),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ]),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             DoctorDetailProfile(
                          //                 idd, useridd,
                          //                 doctorionid:
                          //                 _doctorlistdata[index]
                          //                     .ion_user_id,
                          //                 doctoruserid:
                          //                 _doctorlistdata[index]
                          //                     .id)));
                        },
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.only(
                                        topLeft:
                                        Radius.circular(10),
                                        topRight:
                                        Radius.circular(10),
                                        bottomLeft:
                                        Radius.circular(0),
                                        bottomRight:
                                        Radius.circular(0),
                                      ),
                                      child: Image.network(
                                          "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?size=338&ext=jpg")),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: PopupMenuButton<int>(
                                    color: Colors.white,
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                    itemBuilder: (context) => [
                                      PopupMenuItem<int>(
                                          value: 0,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .dashboard_customize,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text("Take Appointment")
                                            ],
                                          )),
                                      PopupMenuItem<int>(
                                          value: 1,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text("Profile")
                                            ],
                                          )),
                                    ],
                                    onSelected: (item) {
                                      // if (item == 0) {
                                      //   Navigator.of(context)
                                      //       .pushReplacementNamed(
                                      //       AppointmentFromDoctorScreen
                                      //           .routeName);
                                      // } else if (item == 1) {
                                      //   Navigator.of(context)
                                      //       .pushReplacementNamed(
                                      //       DoctorDetailProfile
                                      //           .routeName);
                                      // }
                                    },
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 10),
                                child: Container(
                                  child: Text(
                                    // "${_tempdoctorlistdata[index].name} ",
                                    "name",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 10),
                              child: Container(
                                child: Text(
                                  // "${_tempdoctorlistdata[index].department}",
                                  "department",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                }),
          )

        ],
      ),
    );
  }
}
