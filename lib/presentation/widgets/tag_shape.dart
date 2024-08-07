import 'package:flutter/material.dart';

class TagShape extends StatelessWidget {
  const TagShape({super.key, this.tag});
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 60,
          width: 40,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 26, 89, 133),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xff3b7096),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              tag ?? 'work',
              style: const TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
