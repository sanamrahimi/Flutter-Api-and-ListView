import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  const ExpandableList({Key? key}) : super(key: key);

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  List<String> name = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
  ];
  List<String> countries = [
    'Afghanistan',
    'Turkey',
    'USA',
    'Canada',
    'Korea',
    'China',
    'Japan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable ListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ExpansionTile(
                        title: Text(
                          name[index].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Container(
                            height: 150,
                            child: ListView.builder(
                                itemCount: countries.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      countries[index].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
