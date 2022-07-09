import 'package:audio_player/datas/courses_json.dart';
import 'package:audio_player/theme/colors.dart';
import 'package:audio_player/theme/padding.dart';
import 'package:audio_player/widgets/custom_heading.dart';
import 'package:audio_player/widgets/custom_my_courses_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            SizedBox(
              height: spacer,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHeading(
                    title: "My Courses",
                    subTitle: "Let's continue shall we ?",
                    color: secondary),
                Text(
                  "${MyCoursesJson.length} Courses",
                  style: TextStyle(fontSize: 15, color: secondary),
                ),
              ],
            ),
            SizedBox(
              height: spacer,
            ),
            Column(
              children: List.generate(MyCoursesJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CustomMyCoursesCard(
                    image: MyCoursesJson[index]['image'],
                    title: MyCoursesJson[index]['title'],
                    instructor: MyCoursesJson[index]['user_name'],
                    videoAmount: MyCoursesJson[index]['video'],
                    percentage: MyCoursesJson[index]['percentage'],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
