import 'package:flutter/material.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({Key? key}) : super(key: key);

  @override
  State<FilterListView> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  TextEditingController searchController = TextEditingController();

  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtering Listiew'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'search', border: OutlineInputBorder()),
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    search = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 500,
                  itemBuilder: (context, index) {
                    late String position = index.toString();

                    if (searchController.text.isEmpty) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        title: Text('john smith' + index.toString()),
                        subtitle: Text('This is a message'),
                      );
                    } else if (position
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        title: RichText(
                          text: TextSpan(
                              text: 'john smith',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: index.toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ]),
                        ),
                        subtitle: Text('This is a message'),
                      );
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
