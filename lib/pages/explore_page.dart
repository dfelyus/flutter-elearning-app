import 'package:audio_player/datas/category_json.dart';
import 'package:audio_player/theme/colors.dart';
import 'package:audio_player/theme/padding.dart';
import 'package:audio_player/widgets/custom_heading.dart';
import 'package:audio_player/widgets/custom_place_holder.dart';
import 'package:audio_player/widgets/custom_search_field.dart';
import 'package:audio_player/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            CustomHeading(
                title: "Explore",
                subTitle: "Seek for your preference",
                color: secondary),
            SizedBox(
              height: spacer,
            ),
            CustomSearchField(
              hintField: "Try Web Design",
              backgroundColor: textWhite,
            ),
            SizedBox(
              height: spacer,
            ),
            CustomTitle(
              title: "Tap Searches",
              extend: false,
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(CategoryJson.length, (index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.5),
                        spreadRadius: 0.0,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Text(
                    CategoryJson[index]["title"],
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: spacer,
            ),
            CustomTitle(
              title: "Categories",
              extend: false,
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Column(
              children: List.generate(AllCategories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CunstomPlaceHolder(
                    title: AllCategories[index]['title'],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
