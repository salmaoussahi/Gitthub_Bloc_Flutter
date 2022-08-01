import 'package:flutter/material.dart';

class RepoPage extends StatelessWidget {
  const RepoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Center(
            child: Text("Trending Repos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ),
          height: 70,
          color: Colors.grey[200],
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "tenserflow",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                  "Computation using data flow graphs for scalable machine learning",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.image),
                      Text(
                        "tenserflow",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text(
                        "5.1k",
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
