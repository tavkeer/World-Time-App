// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final String t;
  const TimeWidget({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return (t.length == 7)
        ? (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    t[0],
                    style: TextStyle(fontSize: 50),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t[2],
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    t[3],
                    style: TextStyle(fontSize: 50),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t[5],
                    style: TextStyle(fontSize: 40, color: Colors.pink),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    t[6],
                    style: TextStyle(fontSize: 40, color: Colors.pink),
                  )
                ],
              )
            ],
          ))
        : (Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t[0],
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    t[1],
                    style: TextStyle(fontSize: 50),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t[3],
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    t[4],
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t[6],
                    style: TextStyle(fontSize: 40, color: Colors.pink),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    t[7],
                    style: TextStyle(fontSize: 40, color: Colors.pink),
                  )
                ],
              )
            ],
          ));
  }
}
