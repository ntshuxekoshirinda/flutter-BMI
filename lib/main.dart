
import 'dart:math';

import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
 const MyApp({super.key});

 @override
 State<MyApp> createState() => _HomePageState(); 
}
class _HomePageState extends State<MyApp> {

  int _selectedGender = 1, _height = 120, _age = 42, _weight = 80;
  double _bmi = 0; 

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      
    home :Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text("BMI Calculator"),
    ),
    body: _build(),
    floatingActionButton: FloatingActionButton(onPressed: () {
      setState(() {
        _bmi = _weight / pow(_height/100, 2);
      });
    },
    child: const Icon(
      Icons.calculate,
    ),
    ),
    ),
    );
  }
  Widget _build() {
    return Column(children: [
      _genderSelector(),
      _heightInput(),
      _weightInput(),
        _ageInput(),
      _bmiResult(),
    ],
    );
  }
  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20
      ),
      ),
      margin:const EdgeInsets.all(10.0,),
      padding:EdgeInsets.symmetric(vertical:15.0,),
      child: Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [Column(
        children: [
        IconButton( iconSize:55,
          onPressed: () {
            setState(
              () {
                _selectedGender = 1;
              }
            );
          }, icon: Icon(Icons.male,
          color: _selectedGender == 1 ? Theme.of(context).colorScheme.primary : Colors.black87,
        ),
        ),
        const Text("Male",
        style: TextStyle(
          fontSize: 30,
        ),)
      ],
      ),
      Column(
        children: [
        IconButton( iconSize:55,
          onPressed: () {
            setState(
              () {
                _selectedGender = 2;
              }
            );
          }, icon: Icon(Icons.female,
          color: _selectedGender == 2 ? Theme.of(context).colorScheme.primary : Colors.black87,
        ),
        ),
        const Text("Female",
        style: TextStyle(
          fontSize: 30,
        ),)
      ],
      )
      ],
    ),
    );
  }
  Widget _heightInput() {
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20
      ),
      ),
      margin:const EdgeInsets.all(15.0,),
      padding:EdgeInsets.symmetric(vertical:15.0,),
      child: Column (
        children: [
          const Text("Height",
          style: TextStyle(
            fontSize: 23,

          ),
          ),
          Slider(
            min: 0,
            max: 272,
            divisions: 272,
            value: _height.toDouble(), onChanged: (value){
              setState(
                () {_height = value.toInt();
                },
              ); 
            },
            ),
            Text("$_height cm")
        ],
      ),
    );
  }




  Widget _weightInput() {
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20
      ),
      ),
      margin:const EdgeInsets.all(15.0,),
      padding:EdgeInsets.symmetric(vertical:15.0, horizontal: 15.0),
      child: Column (
        children: [
          const Text("Weight",
          style: TextStyle(
            fontSize: 23,
          ), 
          ),
          Slider(
            min: 30,
            max: 300,
            divisions: 300,
            value: _weight.toDouble(), onChanged: (value){
              setState(
                () {_weight = value.toInt();
                },
              ); 
            },
            ),
            Text("$_weight kg")
        ],
      ),
    );
      }

      Widget _ageInput() {
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20
      ),
      ),
      margin:const EdgeInsets.all(15.0,),
      padding:EdgeInsets.symmetric(vertical:15.0, horizontal: 15.0),
      child: Column (
        children: [
          const Text("age",
          style: TextStyle(
            fontSize: 23,
          ), 
          ),
          Slider(
            min: 0,
            max: 120,
            divisions: 120,
            value: _age.toDouble(), onChanged: (value){
              setState(
                () {_age = value.toInt();
                },
              ); 
            },
            ),
            Text("$_age years")
        ],
      ),
    );
      }

    Widget _bmiResult(){
      return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20
      ),
      ),
      margin:const EdgeInsets.all(15.0,),
      padding:EdgeInsets.symmetric(vertical:15.0, horizontal: 15.0),
      child: Text ("BMI ${_bmi.toStringAsFixed(2)}",
      style: TextStyle(fontSize: 23),
      )
      );
    }
  } 

