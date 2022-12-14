// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thingistan/resources/colors.dart';
import 'package:thingistan/utilities/routes/routes_name.dart';
import 'package:thingistan/view_model/subcategory_view_viewModel.dart';

import '../data/response/status.dart';
import '../resources/app_url.dart';
import '../resources/theme.dart';

class SubcategoryView extends StatefulWidget {
  final String data;
  final String catId;
  const SubcategoryView({Key? key, required this.data, required this.catId})
      : super(key: key);

  @override
  State<SubcategoryView> createState() => _SubcategoryViewState();
}

class _SubcategoryViewState extends State<SubcategoryView> {
  SubcategoryViewViewModel subcategoryVVmodel = SubcategoryViewViewModel();
  @override
  void initState() {
    if (kDebugMode) {
      print(widget.catId);
    }
    subcategoryVVmodel.fetchSubcategoryApi(context, widget.catId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => subcategoryVVmodel),
        ],
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child:
              Consumer<SubcategoryViewViewModel>(builder: (context, value, _) {
            switch (value.subcategoryList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.COMPLETED:
                return GridView.builder(
                  itemCount: value.subcategoryList.data!.result!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                  ),
                  itemBuilder: (context, index) {
                    var row = value.subcategoryList.data!.result![index];
                    return subCatView(
                      catId: row.catId.toString(),
                      imgLocation: row.subcatImage.toString(),
                      subcategoryName: row.subcatName.toString(),
                      subCatId: row.subcatId.toString(),
                      subcategoryDesc: row.subcatDesc.toString(),
                    );
                  },
                );
              case Status.ERROR:
                return Center(
                  child: Text(
                    value.subcategoryList.message.toString(),
                  ),
                );
              default:
                return const Text("Some Error Found");
            }
          }),
        ),
      ),
    );
  }
}

class subCatView extends StatelessWidget {
  final imgLocation;

  final subcategoryName;
  final subcategoryDesc;
  final catId;
  final subCatId;

  const subCatView(
      {Key? key,
      this.imgLocation,
      this.subcategoryName,
      this.subcategoryDesc,
      this.catId,
      this.subCatId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.blackColor)),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              var obj = {
                "catId": catId,
                "subCatId": subCatId,
                "subcategoryName": subcategoryName
              };
              Navigator.pushNamed(
                context,
                RoutesName.product,
                arguments: obj,
              );
            },
            child: ClipRRect(
              // borderRadius: const BorderRadius.only(
              //   topLeft: Radius.circular(8.0),
              //   topRight: Radius.circular(8.0),
              // ),
              child: Image.network(
                AppUrl.subcategoryImage + imgLocation,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              subcategoryName.length > 20
                  ? subcategoryName.substring(0, 20) + '...'
                  : subcategoryName,
              style: AppTheme.h1Style.copyWith(fontSize: 13),
            ),
          ),
          if (subcategoryDesc != "")
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  subcategoryDesc != "" ? subcategoryDesc : '',
                  style: AppTheme.h4Style.copyWith(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
