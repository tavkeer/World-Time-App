import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time='';
  String flag;
  String url;
  bool isDaytime=true;

  WorldTime({this.location = '', this.flag = '', this.url = ''});
  Future<void> getTime() async {
      try{
        //This Async keyword helps us to tell that it is an Asynchronous code function
        //simulate a network request form a network or database


        //make the request
        Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);

        //get properties from data
        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);
        String minOffset = data['utc_offset'].substring(4,6);

        DateTime now = DateTime.parse(dateTime);
        if(data['utc_offset'][0] == '+'){
          now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(minOffset)));
        }
        else
          {
            now = now.subtract(Duration(hours: int.parse(offset), minutes: int.parse(minOffset)));
          }

        //set time property
        time = DateFormat.jm().format(now);
        isDaytime = (now.hour>7 && now.hour<18) ? true:false;
      }
      catch(e)
    {
      time = 'Loading!...';
    }
  }
}

