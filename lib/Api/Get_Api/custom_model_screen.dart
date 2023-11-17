import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomModelScreen extends StatefulWidget {
  const CustomModelScreen({Key? key}) : super(key: key);

  @override
  _CustomModelScreenState createState() => _CustomModelScreenState();
}

class _CustomModelScreenState extends State<CustomModelScreen> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  return ListView.builder(
                      itemCount: photosList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
                          title: Text('Notes id:' +
                              snapshot.data![index].id.toString()),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;

  int id;

  Photos({required this.title, required this.url, required this.id});
}

// import 'dart:convert';
//
// import 'package:example/models/photos_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class CustomModelScreen extends StatefulWidget {
//   const CustomModelScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CustomModelScreen> createState() => _CustomModelScreenState();
// }
//
// class _CustomModelScreenState extends State<CustomModelScreen> {
//
//   List<PhotosModel> photosList = [];
//
//   Future<List<PhotosModel>> getPhotosApi () async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//     var data = jsonDecode(response.body.toString());
//
//     if(response.statusCode ==200){
//       for(Map i in data){
//         photosList.add(PhotosModel.fromJson(i));
//       }return photosList;
//     }else{
//       return photosList;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments Api'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: FutureBuilder(
//                 future: getPhotosApi(),
//                 builder: (context, snapshot){
//                   if(!snapshot.hasData){
//                     return Text('loading');
//                   }else{
//                     return ListView.builder(
//                         itemCount: photosList.length,
//                         itemBuilder: (context, index){
//                           return ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(photosList[index].url.toString()),
//                             ),
//                             title: Text(photosList[index].title.toString()),
//                             subtitle: Text(photosList[index].thumbnailUrl.toString()),
//
//                           );
//                         }
//                     );
//                   }
//                 },
//               ))
//         ],
//       ),
//
//     );
//   }
// }
