import 'package:flutter/material.dart';

class TextButtonsWidget extends StatelessWidget {
  const TextButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          onPressed: (){

          }, child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/login_screen');
            },
            child: const Text('Войти')),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white54,
          ),
          onPressed: (){},
          child: const Text('Забыли пароль?'),
        ),
      ],
    );
  }
}
