import 'dart:convert';

import 'package:api_and_listview/Api/Models/users_mdel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PluginModelScreen extends StatefulWidget {
  const PluginModelScreen({Key? key}) : super(key: key);

  @override
  State<PluginModelScreen> createState() => _PluginModelScreenState();
}

List<UsersModel> usersList = [];

Future<List<UsersModel>> getUsersApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    for (Map i in data) {
      usersList.add(UsersModel.fromJson(i));
    }
    return usersList;
  } else {
    return usersList;
  }
}

class _PluginModelScreenState extends State<PluginModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUsersApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('loading');
              } else {
                return ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(usersList[index].name.toString()),
                          Text(usersList[index].address!.street.toString()),
                          Text(usersList[index].address!.geo!.lat.toString()),
                          Text(usersList[index].phone.toString()),
                          Divider()
                        ],
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
