import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:get_connect_with_state_mixin/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) => ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(data[index]['picture']['large']),
                      ),
                      title: Text(
                        data[index]['name']['title'] +
                            " " +
                            data[index]['name']['first'] +
                            " " +
                            data[index]['name']['last'],
                      ),
                      subtitle: Text(
                        data[index]['email'],
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Text(
                        "Age : " + data[index]['dob']['age'].toString(),
                      ),
                    ),
                  ],
                ),
              );
            }),
        onError: (error) => Center(
          child: Text(error),
        ),
      ),
    );
  }
}
