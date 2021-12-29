import 'package:aplikasi_tilang_training/model/user.dart';
import 'package:aplikasi_tilang_training/runner/main.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
          future: getUsers(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data
                  .map((user) => Container(
                        child: Column(
                          children: [
                            Text(user.nameUser),
                            Text(user.emailUser),
                            // Text(user.passwordUser),
                            Text(user.phoneUser)
                          ],
                        ),
                      ))
                  .toList(),
            );
          }),
    );
  }

  Future<List<User>> getUsers() async {
    final response = await client
        .from('m_user')
        .select()
        // .order('nameUser', ascending: true)
        .execute();

    final dataList = response.data as List;
    return dataList.map((map) => User.fromJson(map)).toList();
  }
}
