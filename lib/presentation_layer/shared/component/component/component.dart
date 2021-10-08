import 'package:breaking_bad/bussness_logic_layer/appCubit.dart';
import 'package:breaking_bad/data_layer/models/character.dart';
import 'package:breaking_bad/presentation_layer/screens/character_details_screen.dart';
import 'package:flutter/material.dart';

Widget character_defination_card(List<character> list, index, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => character_details(
            list: list,
            index: index,
          ),
        ),
      );
    },
    child: Hero(
      tag: list[index].charId,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 1 / 3,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1 / 3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: list[index].img.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/loading.gif',
                          image: list[index].img,
                        )
                      : Image.asset(
                          'assets/images/offline.jpg',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Center(
                      child: Text(
                    '${list[index].name}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget GridView_of_character(List<character> list, context) {
  var cubit = appCubit.get(context);
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 10.0,
      end: 10.0,
      top: 10.0,
    ),
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 2 / 3,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) =>
          character_defination_card(list, index, context),
      itemCount: cubit.isSearch
          ? cubit.searched_character.length
          : cubit.all_characters.length,
    ),
  );
}
