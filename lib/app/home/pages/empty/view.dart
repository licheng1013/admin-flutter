import 'package:flutter/material.dart';


 class EmptyPage extends StatelessWidget {
   const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          "空",
          style: TextStyle(fontSize: 26),
        ));
  }
}