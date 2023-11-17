import 'dart:convert';

import 'package:api_and_listview/Api/Models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostsModel> postsList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        postsList.add(PostsModel.fromJson(i));
      }
      return postsList;
    } else {
      return postsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post List Get Api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapsot) {
              if (!snapsot.hasData) {
                return Text('loading');
              } else {
                return ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(postsList[index].title.toString()),
                      subtitle: Text(postsList[index].body.toString()),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
