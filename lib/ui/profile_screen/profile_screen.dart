import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_trip/constants/app_assets.dart';

import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).kidTrip),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(AppAssets.images.profileImage),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Иманкулова Айнагуль',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'MAMC Рисёрч',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text('Логин: ', style: AppStyles.s12w500),
                            Text(
                              'Aigul@gmail.com',
                              style:
                              AppStyles.s16w500.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                PollsContainerWidget(
                  pollTitle: 'Мои дети',
                ),
                SizedBox(
                  height: 20,
                ),
                PollsContainerWidget(
                  pollTitle: 'Расписание поездок',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PollsContainerWidget extends StatelessWidget {
  const PollsContainerWidget({Key? key, required this.pollTitle})
      : super(key: key);
  final String pollTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.folder),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              pollTitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}