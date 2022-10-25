import 'package:flutter/material.dart';
import 'package:world_real_time/service/world_time.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({super.key});

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'Europe.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'Australia.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'America.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'Dubai.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'India.png'),
  ];

  void updateTime(index) async
  {
    WorldTime instance=locations[index];
    await instance.getTime();
    //naviagte to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'date': instance.date,
      'isDayTime': instance.isDayTime, 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
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
