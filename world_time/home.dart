import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= { };

  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)?.settings?.arguments as Map;
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImg=data['isDayTime']? 'day.png' : 'night.png';
    Color bgColor=data['isDayTime']? Colors.blue : Colors.indigo;
    
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        // child: Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image:AssetImage('assets/$bgImg'))
        //       fit: BoxFit.fill,
        //   ),
        child: Container(
          
          decoration:  BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/$bgImg'),
          fit: BoxFit.fill),
          ),
          
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location') ;
                   setState(() {
                    data={
                      'time': result['time'],
                      'location': result['location'],
                      'date': result['date'],
                      'isDayTime': result['isDayTime'],
                    };
                     
                   });
                  },
                  icon: Icon(Icons.edit_location,
                  color: Colors.grey[300],
                  ), 
                  label: Text('edit location',
                  style:TextStyle(
                    color: Colors.white,
                  )
                  ),

                  ),
                  SizedBox( height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          color: Colors.black,
                        )
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 20.0,),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 50.0,
                          letterSpacing: 0.0,
                          color: Colors.black,
                        )
                      ),
                      SizedBox(height: 20.0,),
                      Text(
                        data['date'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          color: Colors.black,
                        )
                      )

              ],
            ),
          ),
        )
        )
    );
  }
}
