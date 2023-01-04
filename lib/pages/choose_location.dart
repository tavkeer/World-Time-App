// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously, unnecessary_string_interpolations

import 'package:flutter/material.dart';

import 'package:world_time/colors/colorsused.dart';
import 'package:world_time/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  final int initialIndex;
  const chooseLocation({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);
  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: "uk.png"),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: "greece.png"),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: "egypt.png"),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: "kenya.png"),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: "usa.png"),
    WorldTime(url: 'America/New_York', location: 'New York', flag: "usa.png"),
    WorldTime(url: 'Asia/Kolkata', location: 'Srinagar', flag: "india.png"),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: "indonesia.png"),
  ];
  void updateTime(dynamic index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarythree,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Choose Location',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            updateTime(widget.initialIndex);
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text("${locations[index].location}"),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
