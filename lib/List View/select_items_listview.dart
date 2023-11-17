import 'package:flutter/material.dart';

class SelectItemsListview extends StatefulWidget {
  const SelectItemsListview({Key? key}) : super(key: key);

  @override
  State<SelectItemsListview> createState() => _SelectItemsListviewState();
}

class _SelectItemsListviewState extends State<SelectItemsListview> {
  List<String> name = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<String> tempArray = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Items'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (tempArray.contains(name[index].toString())) {
                          tempArray.remove(name[index].toString());
                        } else {
                          tempArray.add(name[index].toString());
                        }
                      });
                      print('my value');
                      print(tempArray.toString());
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(name[index].toString()),
                        trailing: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: tempArray.contains(name[index].toString())
                                  ? Colors.red
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                                tempArray.contains(name[index].toString())
                                    ? 'Remove'
                                    : 'Add'),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
