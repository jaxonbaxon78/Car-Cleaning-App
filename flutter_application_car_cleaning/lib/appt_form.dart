import 'package:flutter/material.dart';
import 'package:flutter_application_car_cleaning/homepage.dart';

class MakeAppt extends StatefulWidget {
  const MakeAppt({super.key});

  @override
  State<MakeAppt> createState() => _MakeApptState();
}

class _MakeApptState extends State<MakeAppt> {
  final _formKey = GlobalKey<FormState>();
  final _carMakeModelController = TextEditingController();

  @override
  void dispose() {
    _carMakeModelController.dispose();
    super.dispose();
  }

  void _makeAppt() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
      // Display a success message with custom color
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You just make an appintment',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
          },
        ),
        title: Text('Make an appointment', style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: const Color.fromRGBO(53, 114, 239, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text('What car do you want cleaned?', style: TextStyle(fontSize: 16.0)),
              TextFormField(
                controller: _carMakeModelController,
                cursorColor: const Color.fromRGBO(53, 114, 239, 1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromRGBO(53, 114, 239, 1)),
                  ),
                  labelText: 'Year, make, model',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the year, make, and model of the car';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text('What kind of car is it?', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 10),
              CarTypeSelection(),
              SizedBox(height: 10),
              Text('Do you want the car washed at your place or mine?', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 10),
              LocationSelection(),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () { 
                    _makeAppt();
                  },
                  child: Text('Confirm Appointment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Location { yours, mine }

class LocationSelection extends StatefulWidget {
  const LocationSelection({super.key});

  @override
  State<LocationSelection> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  Location? _location = Location.mine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ListTile(
          title: const Text('My Place'),
          leading: Radio<Location>(
            value: Location.mine,
            groupValue: _location,
            onChanged: (Location? value) {
              setState(() {
                _location = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Your Place'),
          leading: Radio<Location>(
            value: Location.yours,
            groupValue: _location,
            onChanged: (Location? value) {
              setState(() {
                _location = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

enum CarType { sedan, sportscar, SUV, LSUV, minivan }

class CarTypeSelection extends StatefulWidget {
  const CarTypeSelection({super.key});

  @override
  State<CarTypeSelection> createState() => _CarTypeSelectionState();
}

class _CarTypeSelectionState extends State<CarTypeSelection> {
  CarType? _carType = CarType.sedan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sedan'),
          leading: Radio<CarType>(
            value: CarType.sedan,
            groupValue: _carType,
            onChanged: (CarType? value) {
              setState(() {
                _carType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Sports Car'),
          leading: Radio<CarType>(
            value: CarType.sportscar,
            groupValue: _carType,
            onChanged: (CarType? value) {
              setState(() {
                _carType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('SUV (2 rows of seats)'),
          leading: Radio<CarType>(
            value: CarType.SUV,
            groupValue: _carType,
            onChanged: (CarType? value) {
              setState(() {
                _carType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Large SUV (3 rows of seats)'),
          leading: Radio<CarType>(
            value: CarType.LSUV,
            groupValue: _carType,
            onChanged: (CarType? value) {
              setState(() {
                _carType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Minivan'),
          leading: Radio<CarType>(
            value: CarType.minivan,
            groupValue: _carType,
            onChanged: (CarType? value) {
              setState(() {
                _carType = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
