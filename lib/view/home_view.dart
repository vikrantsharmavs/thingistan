// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, camel_case_types

import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../resources/app_url.dart';
import '../utilities/routes/routes_name.dart';
import '../view_model/category_view_viewModel.dart';
import '../view_model/home_view_model.dart';
import '../view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  CategoryViewViewModel categoryViewViewModel = CategoryViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchBannerApi(context);
    categoryViewViewModel.categoryData(context);
    super.initState();
  }

  @override
  void dispose() {
    homeViewViewModel.fetchBannerApi(context);
    categoryViewViewModel.categoryData(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MVVM"),
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(
                child: Text("Logout"),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => homeViewViewModel),
            ChangeNotifierProvider(create: (_) => categoryViewViewModel),
            ChangeNotifierProvider(create: (_) => UserViewModel()),
          ],
          child: Column(
            children: [
              Consumer<HomeViewViewModel>(builder: (context, value, _) {
                switch (value.bannerList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case Status.COMPLETED:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: ListView.builder(
                          itemCount: value.bannerList.data!.result!.length,
                          itemBuilder: (context, index) {
                            var row = value.bannerList.data!.result![index];
                            return Card(
                              child: ListTile(
                                leading: Image.network(
                                  AppUrl.bannerImage +
                                      row.bannerImage.toString(),
                                  errorBuilder: (context, error, stack) {
                                    return const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    );
                                  },
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(row.bannerName.toString()),
                                subtitle: Text(row.bannerDesc.toString()),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(
                        value.bannerList.message.toString(),
                      ),
                    );
                  default:
                    return const Text("Some Error Found");
                }
              }),
              Consumer<CategoryViewViewModel>(builder: (context, category, _) {
                switch (category.categoryList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case Status.COMPLETED:
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          shrinkWrap: true,
                          itemCount:
                              category.categoryList.data!.results!.length,
                          itemBuilder: (context, index) {
                            var row =
                                category.categoryList.data!.results![index];
                            return myListView(
                              imgLocation: AppUrl.categoryImage +
                                  row.catImage.toString(),
                              imgCaption: row.catName.toString(),
                              allData: row.catName.toString(),
                              catId: row.catId.toString(),
                            );
                          },
                        ),
                      ),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(
                        category.categoryList.message.toString(),
                      ),
                    );
                  default:
                    return const Text("Some Error Found");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class myListView extends StatelessWidget {
  final imgLocation;

  final imgCaption;
  final allData;
  final catId;

  myListView(
      {Key? key, this.imgLocation, this.imgCaption, this.allData, this.catId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.33,
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: InkWell(
          onTap: () {
            var objectData = {"data": allData, "catId": catId};
            Navigator.pushNamed(
              context,
              RoutesName.subcategory,
              arguments: objectData,
            );
            // print(All_data);
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    imgLocation,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: Text(
                      imgCaption.length > 13
                          ? imgCaption.substring(0, 13) + '...'
                          : imgCaption,
                      // style: AppTheme.h4Style.copyWith(fontSize: 13),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
