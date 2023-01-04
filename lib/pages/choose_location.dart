// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class chooseLocation extends StatefulWidget {


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
  void updateTime(dynamic index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      //navigate to home screen
      Navigator.pop(context, {
        'location' : instance.location,
        'flag': instance.flag,
        'time':instance.time,
        'isDaytime':instance.isDaytime
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 5),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text("${locations[index].location}"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
