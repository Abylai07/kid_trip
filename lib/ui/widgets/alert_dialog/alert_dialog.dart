import 'package:flutter/cupertino.dart';

class AppAlertDialog {
  void showDialog({
    required BuildContext context,
    required Function() yes,
    required Function() no,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Пожалуйста перепроверьте данные перед тем как отправить"),
          content: const Text("Вы действительно хотите совершить данное действие?"),
          actions: [
            CupertinoDialogAction(onPressed: yes, child: const Text("Да")),
            CupertinoDialogAction(onPressed: no, child: const Text("Нет"))
          ],
        );
      },
    );
  }
}
