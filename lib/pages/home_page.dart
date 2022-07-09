import 'package:audio_player/datas/category_json.dart';
import 'package:audio_player/datas/courses_json.dart';
import 'package:audio_player/theme/colors.dart';
import 'package:audio_player/theme/padding.dart';
import 'package:audio_player/widgets/clipper.dart';
import 'package:audio_player/widgets/custom_categories_button.dart';
import 'package:audio_player/widgets/custom_category_card.dart';
import 'package:audio_player/widgets/custom_course_card.dart';
import 'package:audio_player/widgets/custom_heading.dart';
import 'package:audio_player/widgets/custom_promotion_card.dart';
import 'package:audio_player/widgets/custom_search_field.dart';
import 'package:audio_player/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
        ),
      ),
      body: getBody(context),
    );
  }
}

Widget getBody(context) {
  var size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                width: size.width,
                height: 300,
                decoration: BoxDecoration(color: secondary),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: appPadding, right: appPadding),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: spacer + 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomHeading(
                          title: "Hi, Sopheamen",
                          subTitle: "Let's start learning",
                          color: textWhite),
                      Container(
                        height: spacer,
                        width: spacer,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/images/user_profile.jpg"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: spacer,
                  ),
                  CustomSearchField(
                    hintField: "Try Web Design",
                    backgroundColor: background,
                  ),
                  SizedBox(
                    height: spacer - 30,
                  ),
                  CustomCategoryCard(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: spacer,
        ),
        CustomPromotionCard(),
        SizedBox(
          height: spacer,
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding, right: appPadding),
          child: CustomTitle(title: "Feature courses"),
        ),
        SizedBox(
          height: spacer,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
              left: appPadding,
            ),
            child: Wrap(
              children: List.generate(CoursesJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    top: 10,
                    bottom: 30,
                  ),
                  child: CustomCourseCardExpand(
                    thumbNail: CoursesJson[index]['image'],
                    videoAmount: CoursesJson[index]['video'],
                    title: CoursesJson[index]['title'],
                    userProfile: CoursesJson[index]['user_profile'],
                    userName: CoursesJson[index]['user_name'],
                    price: CoursesJson[index]['price'],
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: spacer - 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding, right: appPadding),
          child: CustomTitle(title: 'Categories'),
        ),
        SizedBox(
          height: smallSpacer,
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(CategoryJson.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                          title: CategoryJson[index]['title']),
                    );
                  }),
                ),
                Row(
                  children: List.generate(CategoryJson2.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                          title: CategoryJson[index]['title']),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: spacer,
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding, right: appPadding),
          child: CustomTitle(title: "Design course"),
        ),
        SizedBox(
          height: spacer,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
              left: appPadding,
            ),
            child: Wrap(
              children: List.generate(CoursesJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    top: 10,
                    bottom: 30,
                  ),
                  child: CustomCourseCardExpand(
                    thumbNail: CoursesJson[index]['image'],
                    videoAmount: CoursesJson[index]['video'],
                    title: CoursesJson[index]['title'],
                    userProfile: CoursesJson[index]['user_profile'],
                    userName: CoursesJson[index]['user_name'],
                    price: CoursesJson[index]['price'],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    ),
  );
}
