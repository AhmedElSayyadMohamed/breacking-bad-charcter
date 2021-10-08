import 'package:breaking_bad/bussness_logic_layer/appCubit.dart';
import 'package:breaking_bad/bussness_logic_layer/appStates.dart';
import 'package:breaking_bad/presentation_layer/characteristics/search_about_character.dart';
import 'package:breaking_bad/presentation_layer/shared/component/component/component.dart';
import 'package:breaking_bad/presentation_layer/shared/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class character_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit, appState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = appCubit.get(context);
        var list =
            cubit.isSearch ? cubit.searched_character : cubit.all_characters;

        return Scaffold(
            backgroundColor: MyColors.grey,
            appBar: AppBar(
              leading: search.togel_between_leading_inAppBar(context),
              title: search.togel_between_title_inAppBar(context),
              actions: search.togel_between_action_inAppBar(context),
            ),
            body: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  return list.length > 0
                      ? GridView_of_character(list, context)
                      : Center(
                          child: CircularProgressIndicator(
                          color: MyColors.yellow,
                        ));
                } else {
                  return build_No_Internet_Widget(context);
                }
              },
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }

  Widget build_No_Internet_Widget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/istockphoto-1313660904-612x612.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 310.0),
              child: Text(
                'Can\'t connect... Please check internet !',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
