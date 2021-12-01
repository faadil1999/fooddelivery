import 'package:flutter/material.dart';
import 'package:fooddelivery/colors_style.dart';
import 'package:fooddelivery/screens/home/title_search_container.dart';

import 'body_content.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleSearchContainer(),
          SizedBox(height: 24.0,),
          BodyContent(),
        ],
      ),
    );
  }
}
