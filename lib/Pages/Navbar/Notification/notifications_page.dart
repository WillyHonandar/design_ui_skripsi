import 'package:flutter/material.dart';

class NotificationsList extends StatefulWidget {
  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Notifications", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      body: Scrollbar(
        child: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 11,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage(Icons.ac_unit), fit: BoxFit.fill)),
              ),
              title: Text("Notifikasi Tilang"),
              subtitle: Text("Detail informasi mengenai tilang"),
              onTap: () {},
              enabled: true,
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
