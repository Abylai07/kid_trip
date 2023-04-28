import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_colors.dart';

class ScheduleChild extends StatefulWidget {
  const ScheduleChild({Key? key}) : super(key: key);

  @override
  State<ScheduleChild> createState() => _ScheduleChildState();
}

class _ScheduleChildState extends State<ScheduleChild> with SingleTickerProviderStateMixin {

  int selectedDate = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7f4f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: "child",
                  child: Container(
                    height: 160,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/png/boy2.png')
                        )
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Рахман Ерман', style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'product'
                      ),),
                      const SizedBox(height: 5,),
                      const Text('Кастеев', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkBlue,
                          fontFamily: 'circe'
                      ),),
                      const SizedBox(height: 15,),
                      Row(
                        children: const [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.star,
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("4.9 Star Rating", style: TextStyle(
                              fontFamily: 'circe'
                          ),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/png/palette.png')
                                )
                            ),
                          ),
                          const SizedBox(width: 5,),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Text("Timetable", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: 'product'
                  ),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          courseWidget("", "Сегодня", "09:00", AppColors.lightBlue, AppColors.darkBlue),
                          courseWidget("", "Завтра", "09:00", AppColors.yellow, const Color(0xff4d4d4d)),
                          courseWidget("", "Суббота", "09:00", AppColors.pink, const Color(0xff4a155f))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Availability", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: 'product'
                  ),),
                  const SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for(int i = 0; i < 7; i++)
                          dateWidget(i),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          timeSlotWidget("11:00 AM", false),
                          timeSlotWidget("12:00 PM", false),
                          timeSlotWidget("01:00 PM", false),
                        ],
                      ),
                      Row(
                        children: [
                          timeSlotWidget("03:00 PM", true),
                          timeSlotWidget("04:00 PM", false),
                          timeSlotWidget("06:00 PM", false),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     padding: const EdgeInsets.all(15),
            //     margin: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
            //     decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //         color: AppColors.darkBlue
            //     ),
            //     child: const Center(
            //       child: Text("Make an Appointment", style: TextStyle(
            //           color: Colors.white,
            //           fontFamily: 'circe',
            //           fontWeight: FontWeight.w700,
            //           fontSize: 18
            //       ),),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
  Container timeSlotWidget(String time, bool isSelected)
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: (isSelected) ? AppColors.pink : AppColors.lightBlue.withOpacity(0.5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.watch_later,
            size: 13,
            color: Colors.grey,
          ),
          const SizedBox(width: 3,),
          Text(time, style: const TextStyle(
              fontSize: 10,
              fontFamily: 'circe'
          ),)
        ],
      ),
    );
  }
  InkWell dateWidget(int i)
  {
    DateTime tempDate = DateTime.now().add(Duration(days: i));
    return InkWell(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 60,
        width: MediaQuery.of(context).size.width*0.11,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: (selectedDate == tempDate.day) ? AppColors.yellow : AppColors.lightBlue.withOpacity(0.5),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 10
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dayValue(tempDate.weekday), style: const TextStyle(
                  fontSize: 10
              ),),
              Text(tempDate.day.toString(), style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),)
            ],
          ),
        ),
      ),
    );

  }
  String dayValue(int weekDayVal)
  {
    List<String> dayString = ['', "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", 'Sun'];
    return dayString[weekDayVal];
  }
  Container courseWidget(String img, String name, String grade, Color color, Color textColor)
  {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name, style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),),
                Text(grade, style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15
                ),)
              ],
            ),
          ),
          Container(
            height: 90,
            width: 70,
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //    image: AssetImage('assets/images/bitmap/$img.png'),
              //     fit: BoxFit.contain
              // )
            ),
          )
        ],
      ),
    );
  }
}
