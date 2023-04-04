import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_trip/constants/app_colors.dart';
import 'package:kid_trip/constants/app_styles.dart';

class ScheduleDriver extends StatefulWidget {
  const ScheduleDriver({Key? key}) : super(key: key);

  @override
  State<ScheduleDriver> createState() => _ScheduleDriverState();
}

class _ScheduleDriverState extends State<ScheduleDriver> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: _kTabs.length, vsync: this);
    super.initState();
  }

  final _kTabs = <Tab>[
    Tab(child: Text('Today', style: AppStyles.labelLarge)),
    Tab(child: Text('Week', style: AppStyles.labelLarge)),
    Tab(child: Text('Month', style: AppStyles.labelLarge)),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Schedule",
          style: AppStyles.labelLarge.merge(
            const TextStyle(
              color: AppColors.black,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 32.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.w,
                  color: AppColors.mainBGColor,
                ),
                borderRadius: BorderRadius.circular(9.w),
              ),
              child: TabBar(
                indicatorColor: AppColors.mainBGColor,
                controller: _tabController,
                indicator: const BoxDecoration(
                  color: AppColors.mainBGColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                unselectedLabelColor: AppColors.black,
                tabs: _kTabs,
              ),
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: _kTabs.length,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBarView(
            controller: _tabController,
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                        itemBuilder: (context, i) {
                          return const ListTile(
                            leading: Text('7.15'),
                            title: Text('IITU - Abay 45'),
                            subtitle: Text('14.00 - 15.55'),
                            trailing: Icon(Icons.access_time),
                          );
                        }),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
