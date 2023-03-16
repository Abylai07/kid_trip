import 'package:flutter/material.dart';


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