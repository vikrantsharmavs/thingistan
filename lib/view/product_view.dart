import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final String catId;
  final String subCatId;
  final String appBarName;
  const ProductView(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.appBarName})
      : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.subCatId);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarName),
      ),
      body: const Center(
        child: Text("Product Name"),
      ),
    );
  }
}
