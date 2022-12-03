import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kid_trip/ui/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red);

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  TextStyle headingStyleIOS = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: CupertinoColors.inactiveGray,
  );
  TextStyle descStyleIOS = const TextStyle(color: CupertinoColors.inactiveGray);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            middle: Text("Settings"),
            trailing: IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
            )),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: CupertinoColors.extraLightBackgroundGray,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Common
                const SizedBox(height: 85),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      "Common",
                      style: headingStyleIOS,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  color: CupertinoColors.white,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.language,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            const Text("Language"),
                            const Spacer(),
                            Text(
                              "English",
                              style: descStyleIOS,
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.inactiveGray,
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        width: double.infinity,
                        height: 38,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.cloud,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            const Text("Environment"),
                            const Spacer(),
                            Text(
                              "Production",
                              style: descStyleIOS,
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.inactiveGray,
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Account
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      "Account",
                      style: headingStyleIOS,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  color: CupertinoColors.white,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(width: 12),
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 12),
                            Text("Phone Number"),
                            Spacer(),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.inactiveGray,
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(width: 12),
                            Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 12),
                            Text("Email"),
                            Spacer(),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.inactiveGray,
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;
                          prefs.clear();
                          Get.offAll(LoginScreen());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 38,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 12),
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 12),
                              Text("Sign Out"),
                              Spacer(),
                              Icon(
                                CupertinoIcons.right_chevron,
                                color: CupertinoColors.inactiveGray,
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Security
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      "Security",
                      style: headingStyleIOS,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  color: CupertinoColors.white,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.phonelink_lock_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            const Text("Lock app in Background"),
                            const Spacer(),
                            CupertinoSwitch(
                                value: lockAppSwitchVal,
                                activeColor: CupertinoColors.destructiveRed,
                                onChanged: (val) {
                                  setState(() {
                                    lockAppSwitchVal = val;
                                  });
                                }),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.fingerprint,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            const Text("Use Fingerprint"),
                            const Spacer(),
                            CupertinoSwitch(
                              value: fingerprintSwitchVal,
                              onChanged: (val) {
                                setState(() {
                                  fingerprintSwitchVal = val;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            const Text("Change Password"),
                            const Spacer(),
                            CupertinoSwitch(
                              value: changePassSwitchVal,
                              activeColor: CupertinoColors.destructiveRed,
                              onChanged: (val) {
                                setState(() {
                                  changePassSwitchVal = val;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Misc
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      "Misc",
                      style: headingStyleIOS,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  color: CupertinoColors.white,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 38,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(width: 12),
                            Icon(
                              Icons.file_open_sharp,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 12),
                            Text("Terms of Service"),
                            Spacer(),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.inactiveGray,
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const Divider(),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;
                          print(prefs.get('token'));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 38,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 12),
                              Icon(
                                Icons.file_copy_sharp,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 12),
                              Text("Print Token"),
                              Spacer(),
                              Icon(
                                CupertinoIcons.right_chevron,
                                color: CupertinoColors.inactiveGray,
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

