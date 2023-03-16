import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../parent_map.dart';
import 'location_service.dart';

class MyFloatActionButton extends StatefulWidget {
  const MyFloatActionButton({Key? key}) : super(key: key);

  @override
  State<MyFloatActionButton> createState() => _MyFloatActionButtonState();
}

class _MyFloatActionButtonState extends State<MyFloatActionButton> {
  TextEditingController firstPointController = TextEditingController();
  TextEditingController secondPointController = TextEditingController();

  final _focusA = FocusNode();
  final _focusB = FocusNode();
  bool _isFocusedA = false;
  bool _isFocusedB = false;

  @override
  void initState() {
    super.initState();
    _focusA.addListener(_onFocusChange);
    _focusB.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusA.removeListener(_onFocusChange);
    _focusB.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocusedA = _focusA.hasFocus;
      _isFocusedB = _focusB.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.extended(
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            backgroundColor: Colors.white,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppAssets.svg.line,
                      height: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      focusNode: _focusA,
                      controller: firstPointController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Point A',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFD3D3D3),
                      ),
                      onChanged: (value) {},
                    ),
                    if (_isFocusedA)
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Показать на карте',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.location_on_outlined),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      focusNode: _focusB,
                      controller: secondPointController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Point B',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFD3D3D3),
                      ),
                      onChanged: (value) {},
                    ),
                    if (_isFocusedB)
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Показать на карте',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.location_on_outlined),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainBGColor,
                          ),
                          onPressed: () async {
                            var place = await LocationService()
                                .getPlace(firstPointController.text);
                            ParentMapState().goToThePlace(place);
                          },
                          child: const Text('Начать поездку'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          label: const Text('GO!'),
          icon: const Icon(Icons.directions_walk_outlined),
        ),
        FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () {
            ParentMapState().goRoute();
          },
          child: const Icon(Icons.center_focus_strong),
        ),
      ],
    );
  }
}
