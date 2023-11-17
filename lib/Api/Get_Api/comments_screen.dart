import 'dart:convert';

import 'package:api_and_listview/Api/Models/coments_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<CommentsModel> commentsList = [];

  Future<List<CommentsModel>> getCommentsApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        commentsList.add(CommentsModel.fromJson(i));
      }
      return commentsList;
    } else {
      return commentsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments Api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getCommentsApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('loading...');
              } else {
                return ListView.builder(
                    itemCount: commentsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(commentsList[index].name.toString()),
                        subtitle: Text(commentsList[index].body.toString()),
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
