import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_trip/constants/app_assets.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:kid_trip/ui/roles/parent/child_screen/child_screen.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/navigator.dart';
import '../../../widgets/buttons/app_button.dart';
import '../parent_navigation.dart';
import 'components/trip_history_widget.dart';
import 'components/tutor_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 180,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: (){
              AppNavigator.push(context: context, page: const ParentNavigation());
            },
            child: Image.asset(
              AppAssets.images.logo,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Мои дети", style: AppStyles.titleSmall),
                    tutorWidget(
                        img: 'girl',
                        name: 'Шырын Ерман',
                        subj: 'Школа имени Кастеева',
                        price: '100',
                        onPressed: () {
                          AppNavigator.push(context: context, page: const ChildScreen(name: 'Шырын Ерман', school: 'Школа имени Кастеева', image: 'assets/images/png/girl.png',));
                        }),
                    tutorWidget(
                        img: 'boy2',
                        name: 'Ермахан Ерман',
                        subj: 'Школа имени Кастеева',
                        price: '100',
                        onPressed: () {
                          AppNavigator.push(context: context, page: const ChildScreen(name: 'Ермахан Ерман', school: 'Школа имени Кастеева', image: 'assets/images/png/boy2.png',));
                        }),
                    tutorWidget(
                        img: 'boy1',
                        name: 'Рахман Ерман',
                        subj: 'Школа имени Кастеева',
                        price: '100',
                        onPressed: () {
                          AppNavigator.push(context: context, page: const ChildScreen(name: 'Рахман Ерман', school: 'Школа имени Кастеева', image: 'assets/images/png/boy1.png',));
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppButton(onPressed: () {  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Добавить ребенка'),
                          SizedBox(width: 12),
                          Icon(Icons.add_circle),
                        ],
                      ),),
                    ),
                    Text("Ближайшие поездки", style: AppStyles.titleSmall),
                    const TripHistoryWidget(
                      pointA: 'Абая 56',
                      pointB: 'Толе би 99',
                      time: '21 марта, в 7:30',
                      status: "В школу",
                    ),
                    const TripHistoryWidget(
                      pointA: 'Толе би 99',
                      pointB: 'Абая 56',
                      time: '21 марта, в 13:00',
                      status: "Домой",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
