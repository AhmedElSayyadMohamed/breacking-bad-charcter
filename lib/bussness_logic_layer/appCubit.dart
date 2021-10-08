import 'package:breaking_bad/bussness_logic_layer/appStates.dart';
import 'package:breaking_bad/data_layer/models/character.dart';
import 'package:breaking_bad/data_layer/repositry/character_repositry.dart';
import 'package:breaking_bad/presentation_layer/characteristics/search_about_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appCubit extends Cubit<appState> {
  late List<character> all_characters = [];
  late List<character> searched_character = all_characters;
  bool isSearch = false;
  var search_text_controller = TextEditingController();

  appCubit() : super(intialState());
  static appCubit get(context) => BlocProvider.of(context);

  void get_all_character_details() {
    repositry.get_all_character_details().then((character) {
      this.all_characters = character;
      emit(character_success());
    });
  }

  void search_techniq(String searched_character, context) {
    var cubit = appCubit.get(context);

    cubit.searched_character = cubit.all_characters
        .where((character) =>
            character.name.toLowerCase().startsWith(searched_character))
        .toList();
    emit(search_about_character());
  }
}
