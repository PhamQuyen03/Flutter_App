import 'package:flutter/material.dart';

class TopStudentsPage extends StatelessWidget {
  final List<Map<String, Object>> data = [
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
    {'name': 'Dang Minh Duoc', 'score': 8.5},
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Bảng xếp hạng lớp',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index + 1}'),
                  Text(
                    '${data[index]['name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('${data[index]['score']}')
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
