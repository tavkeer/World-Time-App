import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Srinagar', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRing(
             color: Colors.white,
             size: 100.0,
        ),
      ),
    );
  }
}
