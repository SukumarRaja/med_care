import 'package:flutter/material.dart';
import 'common_text.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.amber,
              toolbarHeight: 150,
              title: Center(child: Text('Patient Express')),
              automaticallyImplyLeading: false,
            ),
            buildListTile(context,
                text: "DashBoard", onPressed: () {}, icon: Icons.dashboard),
            buildDivider(),
            buildAppointment(context),
            buildDivider(),
            buildListTile(context,
                text: "Prescription", onPressed: () {}, icon: Icons.file_copy),
            Divider(
              height: 2,
            ),
            buildPayment(context),
            buildDivider(),
            buildDoctor(context),
            buildDivider(),
            buildListTile(context,
                text: "Profile", onPressed: () {}, icon: Icons.person),
            buildDivider(),
            buildListTile(context,
                text: "Settings", onPressed: () {}, icon: Icons.settings),
            buildDivider(),
            buildListTile(context,
                text: "Logout", onPressed: () {}, icon: Icons.exit_to_app),
          ],
        ),
      ),
    );
  }

  Theme buildDoctor(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(
          Icons.search,
        ),
        title: CommonText(
          text: "Doctor Search",
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(Icons.add_business_rounded),
              title: CommonText(
                text: "Departments",
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 3,
    );
  }

  Theme buildPayment(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        leading: Icon(
          Icons.payment,
        ),
        title: CommonText(
          text: "Payment",
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(
                Icons.payment,
              ),
              title: CommonText(
                text: "Add Payment",
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(
                Icons.payments_outlined,
              ),
              title: CommonText(text: "All Invoices"),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(Icons.payments_outlined),
              title: CommonText(text: "Deposit"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Theme buildAppointment(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        leading: Icon(
          Icons.list,
        ),
        title: CommonText(text: "Appointments"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(
                Icons.add_circle_outline,
              ),
              title: CommonText(
                text: "Appointment Request",
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(
                Icons.today,
              ),
              title: CommonText(
                text: "Today Appointment",
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(
                Icons.list,
              ),
              title: CommonText(
                text: "Appointment List",
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context,
      {required String text,
      required Function() onPressed,
      required IconData icon}) {
    return ListTile(
        leading: Icon(icon),
        title: CommonText(
          text: text,
        ),
        onTap: onPressed);
  }
}
