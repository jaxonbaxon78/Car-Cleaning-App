import 'package:flutter/material.dart';
import 'package:flutter_application_car_cleaning/appt_form.dart';
// import 'package:flutter_application_car_cleaning/appt_form.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color.fromRGBO(53, 114, 239, 1),
      ),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/car1.jpg', height: 250,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/car2.jpg', height: 250),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => MakeAppt()
                  ));
                },
              child: const Text('Create Appointment'),
              ),
            )
          ],
        ),
      ))
    );
  }
}

/*
class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color.fromRGBO(53, 114, 239, 1),
      ),
      body:
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/car1.jpg', height: 250),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/cs2.jpg', height: 250),
              ),
            ],
          ),
          ),
          /*
          child: ElevatedButton(
            onPressed: () async {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => make_appt()
                  ));
            },
            child: const Text('Create Appointment'),
          ),
          */
        )
        
    );
  }
}
*/