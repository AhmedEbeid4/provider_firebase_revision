import 'package:exam/providers/provider_example.dart';
import 'package:exam/views/home_view.dart';
import 'package:exam/views/start_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=> ProviderExample(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: StartView.routeName,
          routes: {
            StartView.routeName : (ctx)=> StartView(),
            HomeView.routeName : (ctx)=> HomeView()
          },
        )
    );
  }
}
