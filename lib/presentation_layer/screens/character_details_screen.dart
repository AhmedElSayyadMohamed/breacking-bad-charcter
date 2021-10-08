import 'package:breaking_bad/data_layer/models/character.dart';
import 'package:breaking_bad/presentation_layer/shared/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class character_details extends StatelessWidget {
  List<character> list = [];
  int index;
  character_details({required this.list, required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          build_Sliver_AppBar(context, index),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ////////////////////////////
                        build_character_Info(
                          title: 'Job :',
                          value: list[index].job.join('/'),
                          context: context,
                        ),
                        build_Divider(256),

                        build_character_Info(
                          title: 'Appeared in :',
                          value: list[index].category,
                          context: context,
                        ),
                        build_Divider(193),

                        build_character_Info(
                          title: 'Appearance Seasons :',
                          value: list[index].appearance.join(' / '),
                          context: context,
                        ),
                        build_Divider(130),

                        build_character_Info(
                          title: 'Status :',
                          value: list[index].status,
                          context: context,
                        ),
                        build_Divider(243),
                        list[index].betterCallSaulAppearance.isEmpty
                            ? Container()
                            : build_character_Info(
                                title: 'Better Call Saul Appearance :',
                                value: list[index]
                                    .betterCallSaulAppearance
                                    .join(' / '),
                                context: context,
                              ),
                        list[index].betterCallSaulAppearance.isEmpty
                            ? Container()
                            : build_Divider(80),
                        list[index].betterCallSaulAppearance.isEmpty
                            ? SizedBox(
                                height: 385,
                              )
                            : SizedBox(
                                height: 335,
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget build_Sliver_AppBar(context, index) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 2.3 / 3,
      leadingWidth: double.infinity,
      backgroundColor: MyColors.yellow,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          list[index].nickname,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        background: Hero(
          tag: list[index].charId,
          child: Image.network(
            list[index].img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget build_character_Info({
    required String title,
    required String value,
    required context,
  }) {
    return Row(
      children: [
        Text(
          '$title',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            child: Text(
              '$value',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build_Divider(double Indent) {
    return Divider(
      height: 30,
      color: Colors.yellow,
      endIndent: Indent,
      thickness: 2,
    );
  }
}
