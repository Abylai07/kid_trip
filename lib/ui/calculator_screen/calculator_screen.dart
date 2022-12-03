import 'package:flutter/material.dart';
import 'package:kid_trip/constants/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/l10n.dart';
import 'components/amount_text_field.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  int howManyChildrenPrice = 1000;
  int weekToSchoolPrice = 2000;
  int extraTripsPrice = 2000;
  int togetherAutoPrice = 5000;
  int togetherMinibusPrice = 3000;

  late String howManyChildren;
  late String weekToSchool;
  late String extraTrips;
  bool togetherAuto = false;
  bool togetherMinibus = false;

  num fullPrice = 0;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).kidTrip),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).chooseYouNeed,
                style: AppStyles.s20w500.merge(const TextStyle(color: Colors.black)),
              ),
              FittedBox(
                child: DataTable(
                  horizontalMargin: 0,
                  columnSpacing: 10,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          S.of(context).description,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          S.of(context).price,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          S.of(context).select,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(S.of(context).howManyChildren)),
                        DataCell(Text(howManyChildrenPrice.toString())),
                        DataCell(AmountTextFiled(
                          onChanged: (newValue){
                            howManyChildren = newValue;
                          },),),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(S.of(context).weekToSchool)),
                        DataCell(Text(weekToSchoolPrice.toString())),
                        DataCell(AmountTextFiled(
                          onChanged: (newValue){
                            weekToSchool = newValue;
                          },
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(S.of(context).extraTrips)),
                        DataCell(Text(extraTripsPrice.toString())),
                        DataCell(AmountTextFiled(
                          onChanged: (newValue){
                            extraTrips = newValue;
                          },
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(S.of(context).togetherAuto)),
                        DataCell(Text(togetherAutoPrice.toString())),
                        DataCell(Checkbox(value: togetherAuto, onChanged: (value){
                          setState((){
                            togetherAuto = value!;
                            if(togetherAuto){
                              togetherMinibus = false;
                            }
                          });
                        })),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(S.of(context).togetherMinibus)),
                        DataCell(Text(togetherMinibusPrice.toString())),
                        DataCell(Checkbox(value: togetherMinibus, onChanged: (value){
                          setState((){
                            togetherMinibus = value!;
                            if(togetherMinibus){
                              togetherAuto = false;
                            }
                          });
                        })),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                fullPrice = int.parse(howManyChildren) * ((howManyChildrenPrice * int.parse(howManyChildren)) + (weekToSchoolPrice * int.parse(weekToSchool)) + (extraTripsPrice * int.parse(extraTrips)));
                if(togetherAuto){
                  fullPrice = fullPrice + togetherAutoPrice;
                } else if(togetherMinibus){
                  fullPrice = fullPrice + togetherMinibusPrice;
                }
                setState((){});
              },
                child: Text(S.of(context).calculate),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('${S.of(context).fullPrice} = $fullPrice', style: AppStyles.s20w500.merge(TextStyle(color: Colors.black)),),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/subscription_screen');
            }, child: Text('new screen'))
            ],
          ),
        ),
      ),
    );
  }
}

