import 'package:flutter/material.dart';

class SubcategoryView extends StatelessWidget {
  const SubcategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(
      title: Text('Product ${arguments['data']}'),
    ));
  }
}
