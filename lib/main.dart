import 'package:breaking_bad/bussness_logic_layer/appStates.dart';
import 'package:breaking_bad/data_layer/web_services_API/character_api.dart';
import 'package:breaking_bad/presentation_layer/screens/character_screen.dart';
import 'package:breaking_bad/presentation_layer/shared/component/constants/Bloc_observer.dart';
import 'package:breaking_bad/presentation_layer/shared/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussness_logic_layer/appCubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  character_webServices.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => appCubit()..get_all_character_details(),
        child: BlocConsumer<appCubit, appState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    //backwardsCompatibility: false,
                    //systemOverlayStyle:
                    //SystemUiOverlayStyle(statusBarColor: MyColors.yellow),
                    backgroundColor: MyColors.yellow,
                  ),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              home: character_screen(),
            );
          },
        ));
  }
}
