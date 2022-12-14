// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'resources/constant.dart';
import 'utilities/routes/routes.dart';
import 'utilities/routes/routes_name.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/services/theme_Services.dart';
import 'view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

// https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/
class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeChanger())
      ],
      child: Builder(builder: (context) {
        final theme = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstant.APPLICATION_NAME,
          themeMode: theme.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            primaryColor: Colors.purple,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal,
            ),
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}
