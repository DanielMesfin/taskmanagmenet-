import 'package:flutter/material.dart';
import 'package:taskmanagmenet/style/style.dart';
import 'package:taskmanagmenet/widget/divider_line.dart';
import 'package:taskmanagmenet/widget/list_title.dart';
import 'package:taskmanagmenet/widget/profile_avotor.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // decoration: const BoxDecoration(gradient: Styles.appGrdient),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                            // gradient: Styles.cardColor
                            ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     ReusableIcon(
                            //       iconData: Icons.arrow_back_ios_new_sharp,
                            //       iconCallBack: () {
                            //         Navigator.pop(context);
                            //       },
                            //     ),
                            //     Expanded(child: Container())
                            //   ],
                            // ),

                            SizedBox(
                              height: 8,
                            ),
                            const ProfileAvatar(),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Daniel Mesfin',
                              style: Styles.completedTaskStyle
                                  .copyWith(fontSize: 18),
                            ),
                            const Text(
                              '0930379106',
                              style: Styles.completedTaskStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 100,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      color: Color(0xff0b35dc)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.logout_rounded,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'LogOut',
                                        style: Styles.incompleteTaskStyle,
                                      )
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white60,
                          ),
                          Positioned(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'App Setting ',
                                      style: Styles.incompleteTaskStyle,
                                      textAlign: TextAlign.start,
                                    ),
                                    Expanded(
                                      child: Container(),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          blurStyle: BlurStyle.solid,
                                          blurRadius: 4,
                                          color: Colors.grey,
                                          offset: Offset(0.0, 0.90))
                                    ],
                                  ),
                                  child: Column(
                                    children: const [
                                      ListTileData(
                                        leaddingData: Icons.messenger,
                                        titleData: 'Feedbacks & Contact',
                                      ),
                                      DividerLine(),
                                      ListTileData(
                                        leaddingData: Icons.info,
                                        titleData: 'About',
                                      ),
                                      DividerLine(),
                                      ListTileData(
                                        leaddingData: Icons.update_rounded,
                                        titleData: 'Check Update',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: const [
                                    Text(
                                      'Version 2.0',
                                      style: Styles.incompleteTaskStyle,
                                    ),
                                    Text(
                                      'daniel \u00a9 2015 E.C',
                                      style: Styles.incompleteTaskStyle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.solid,
                              blurRadius: 4,
                              color: Colors.grey,
                              offset: Offset(0.0, 0.90))
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTileData(
                            leaddingData: Icons.account_circle,
                            titleData: 'Daniel Mesfin ',
                            callBack: () {},
                          ),
                          const DividerLine(),
                          ListTileData(
                            leaddingData: Icons.language_rounded,
                            titleData: 'Mobile Application Developer',
                            callBack: () {},
                          ),
                          const DividerLine(),
                          ListTileData(
                            callBack: () {},
                            leaddingData: Icons.category,
                            titleData: 'Software Engineer',
                          ),
                          const DividerLine(),
                          ListTileData(
                            callBack: () {},
                            leaddingData: Icons.mobile_screen_share,
                            titleData: '@Invite Friends',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
