import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool enable = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      enable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Effect'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (enable) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        title: Container(
                          color: Colors.white,
                          height: 10,
                          width: 100,
                        ),
                      ),
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: enable,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        title: Text('joh smith'),
                        subtitle: Text('description'),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
