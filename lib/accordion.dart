import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  Accordion(
      this.title, {
        Key? key,
        this.height = 200.0,
        this.width = 400.0,
        required this.contentWidget,
      }) : super(key: key);
  final String title;
  final double height;
  final double width;
  final Widget contentWidget;

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 3),
              margin: const EdgeInsets.only(right: 10, left: 10, top: 13),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey),
                borderRadius: isOpen
                    ? const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                    : BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            isOpen
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          isOpen ? Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),
              ),
            ),
            child: widget.contentWidget,
          )
              : Container(),
        ],
      ),
    );
  }
}
