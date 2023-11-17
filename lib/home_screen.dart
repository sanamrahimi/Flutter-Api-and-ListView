import 'package:api_and_listview/Api/Get_Api/comments_screen.dart';
import 'package:api_and_listview/Api/Get_Api/complexJson_screen.dart';
import 'package:api_and_listview/Api/Get_Api/custom_model_screen.dart';
import 'package:api_and_listview/Api/Get_Api/drop_down_api.dart';
import 'package:api_and_listview/Api/Get_Api/plugin_model_screen.dart';
import 'package:api_and_listview/Api/Get_Api/with_model_screen.dart';
import 'package:api_and_listview/Api/Get_Api/without_model_screen.dart';
import 'package:api_and_listview/Api/Post_Api/signup.dart';
import 'package:api_and_listview/Api/Post_Api/upload_image.dart';
import 'package:api_and_listview/List%20View/select_items_listview.dart';
import 'package:api_and_listview/List%20View/simmer_effect.dart';
import 'package:api_and_listview/RoundButton.dart';
import 'package:flutter/material.dart';

import 'List View/expandable_list.dart';
import 'List View/filter_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API and ListView Builder'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Get Api',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'Ai call with Modepl',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'Custom Model',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomModelScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'Plugin Model',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PluginModelScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'No Model',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NoModel()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'Complex Json passing from Object',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ComplexJson()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'Comments Api',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentsScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                title: 'DropDown Api',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DropDownApi()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Post Api',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                buttonColor: Colors.green,
                title: 'Login and Sign Up Api',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                buttonColor: Colors.green,
                title: 'Upload Image',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UploadImageScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'List View Builder',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                buttonColor: Colors.blue,
                title: 'Expandable List',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandableList()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                buttonColor: Colors.blue,
                title: 'Filter ListView',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterListView()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                buttonColor: Colors.blue,
                title: 'Select Items Listview',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectItemsListview()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                height: 50,
                buttonColor: Colors.blue,
                title: 'ShimmerEffect',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShimmerEffect()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
