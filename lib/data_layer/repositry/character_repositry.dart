import 'package:breaking_bad/data_layer/models/character.dart';
import 'package:breaking_bad/data_layer/web_services_API/character_api.dart';

class repositry {
  static Future<List<character>> get_all_character_details() async {
    final allcharacters = await character_webServices.all_character_details();

    List<character> characters =
        allcharacters.map((e) => character.fromJson(e)).toList();
    print(characters[0].name);
    return characters;
  }
}
