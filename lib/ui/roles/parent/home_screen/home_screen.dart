import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_assets.dart';

import '../../../../constants/app_colors.dart';



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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ), onPressed: () {  },
          )
        ],
      ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.images.searchBg),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Добро пожаловать", style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'circe'
                  ),),
                  Text("Айгул Арманова", style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'circe',
                      fontWeight: FontWeight.w700
                  ),),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Мои дети", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text("Все", style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 13
                        ),)
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            tutorWidget("girl", "Шырын Ерман", "Школа имени Кастеева", "0-4", "100"),
                            tutorWidget("boy2", "Ермахан Ерман", "Школа имени Кастеева", "0-2", "100"),
                            tutorWidget("boy1", "Рахман Ерман", "Школа имени Кастеева", "0-2", "100"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
  InkWell tutorWidget(String img, String name, String subj, String grade, String price)
  {
    return InkWell(
      onTap: openTeacherPage,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: AppColors.lightBlue.withOpacity(0.5)
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30)),
                  child: Container(
                    height: 125,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.images.iconBgNew),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Stack(
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.star,
                            color: AppColors.darkBlue,
                            size: 60,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Text("4.5", style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 50,
                  child: Hero(
                    tag: img,
                    child: Container(
                      width: 100,
                      height: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/png/$img.png'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("GRADE $grade",style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                        ),)
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Text(name, style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700
                    ),),
                    Text(subj, style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkBlue
                    ),),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$$price/session",style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void openTeacherPage()
  {
    Navigator.pushNamed(context, '/child_screen');
  }
}



