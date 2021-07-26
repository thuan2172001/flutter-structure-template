import 'package:flutter/material.dart';
import 'package:flutter_auth/Config/color_config.dart';
import 'package:flutter_auth/Services/Storage/user_storage_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        titleTextStyle: TextStyle(
          color: ColorConfig.darkColor,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: ColorConfig.darkColor, shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/User Icon.svg"),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      UserStorageService.getUserBy('username'),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: ColorConfig.darkColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(child: Text("Edit")),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(Icons.dark_mode_outlined),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Dark mode",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(Icons.notifications_none_outlined),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 0, top: 5,),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(Icons.location_on_outlined),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "News by location",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 0),
            child: ListTile(
              leading: Icon(
                Icons.language_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Language",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
