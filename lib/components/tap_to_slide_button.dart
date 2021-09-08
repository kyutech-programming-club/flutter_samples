import 'package:flutter/material.dart';

class SlideButton extends StatefulWidget {
  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {

  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 2,left: 2,right: 2),
              alignment: Alignment.center,
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: _isSelected ? Colors.greenAccent : Colors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 55,
              height: 25,
              child: AnimatedAlign(
                alignment: _isSelected ? Alignment.topRight: Alignment.topLeft,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isSelected ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}