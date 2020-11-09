import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

class TestSuggest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hôm nay làm gì?',
            style: TextStyle(
                fontSize: 16,
                color: Palette.commonHeading,
                fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('dsfds'),
                );
              },
              itemCount: 20,
            ),
          ),
          FlatButton(
            minWidth: double.infinity,
            textColor: Palette.primaryColor_400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
            onPressed: () => print('Hello'),
            color: Palette.primaryColor_100,
            child: Text('Hiển thị thêm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}

class ItemTestSuggest extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

