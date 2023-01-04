import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = (data.isEmpty) ? ModalRoute.of(context)!.settings.arguments as Map : data;
    print(data);

    String bgimage = (data['isDaytime']) ? 'day.png':'night.png';

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async{
                      dynamic result =  await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time' :result['time'],
                          'location':result['location'],
                          'flag':result['flag'],
                          'isDaytime':result['isDaytime']
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.black,
                    ),
                    label:const Text(
                        'Edit Location',
                        style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style:const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style:const TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
