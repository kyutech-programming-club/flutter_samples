import 'package:flutter/material.dart';

class SlideButton extends StatefulWidget {
  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {

  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          setState(() {
            _index++;
          });
        },
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: _index % 2 == 1 ? Colors.greenAccent : Colors.white,
              ),
              child: AnimatedAlign(
                alignment: _alignment,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _index % 2 == 1 ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}