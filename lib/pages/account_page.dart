import 'package:audio_player/datas/account_menu_json.dart';
import 'package:audio_player/theme/colors.dart';
import 'package:audio_player/theme/padding.dart';
import 'package:audio_player/widgets/custom_button_box.dart';
import 'package:audio_player/widgets/custom_heading.dart';
import 'package:audio_player/widgets/custom_place_holder.dart';
import 'package:audio_player/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    List items = AccountMenuJson[2]['categories'];

    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          SizedBox(
            height: spacer,
          ),
          CustomHeading(
            title: "Account",
            subTitle: "student",
            color: secondary,
          ),
          SizedBox(
            height: spacer,
          ),
          CustomTitle(
            title: "Support",
            extend: false,
          ),
          SizedBox(
            height: spacer,
          ),
          Column(
            children: List.generate(items.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: CunstomPlaceHolder(title: items[index]['title']),
              );
            }),
          ),
          SizedBox(
            height: spacer,
          ),
          CustomButtonBox(title: "Sign In"),
        ],
      ),
    );
  }
}
