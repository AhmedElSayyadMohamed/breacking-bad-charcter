import 'package:breaking_bad/data_layer/models/character.dart';

abstract class appState {}

class intialState extends appState {}

class character_success extends appState {}

class character_loading extends appState {}

class character_error extends appState {}

class search_about_character extends appState {}
