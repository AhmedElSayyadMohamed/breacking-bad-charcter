import 'package:breaking_bad/bussness_logic_layer/appCubit.dart';
import 'package:breaking_bad/data_layer/models/character.dart';
import 'package:breaking_bad/presentation_layer/shared/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class search {
  static Widget togel_between_title_inAppBar(context) {
    var cubit = appCubit.get(context);
    if (cubit.isSearch)
      return Center(
        child: TextField(
          controller: cubit.search_text_controller,
          cursorColor: MyColors.grey,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Find a character....',
              hintStyle: TextStyle(
                fontSize: 18,
                color: MyColors.grey,
              )),
          style: TextStyle(
            fontSize: 18,
            color: MyColors.grey,
          ),
          onChanged: (searched_character) {
            cubit.search_techniq(searched_character, context);
            print(cubit.search_text_controller.text);
          },
        ),
      );
    else
      return Text(
        'Characters',
        style: Theme.of(context).textTheme.bodyText1,
      );
  }

  static Widget togel_between_leading_inAppBar(context) {
    var cubit = appCubit.get(context);
    if (cubit.isSearch)
      return BackButton(
        color: MyColors.grey,
      );
    else
      return Container();
  }

  static List<Widget> togel_between_action_inAppBar(context) {
    var cubit = appCubit.get(context);
    if (cubit.isSearch)
      return [
        IconButton(
          onPressed: () {
            cubit.search_text_controller.clear();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            size: 27,
          ),
          color: MyColors.grey,
        )
      ];
    else
      return [
        IconButton(
          onPressed: () {
            start_search(context);
            cubit.isSearch = true;
          },
          icon: Icon(
            Icons.search,
            size: 27,
          ),
          color: MyColors.grey,
        )
      ];
  }

  static void start_search(context) {
    var cubit = appCubit.get(context);

    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        stop_search(context);
      },
    ));
    cubit.isSearch = true;
  }

  static void stop_search(context) {
    var cubit = appCubit.get(context);

    cubit.search_text_controller.clear();
    cubit.searched_character = [];
    cubit.searched_character = cubit.all_characters;
    cubit.isSearch = false;
  }
}
