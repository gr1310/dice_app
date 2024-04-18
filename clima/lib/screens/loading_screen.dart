import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const api_key= 'a3fcaf134408b3f7dca28adb596cd36e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = (location.latitude);
    var longitude= (location.longitude);

    NetworkHelper networkHelper= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key');


    var data= await networkHelper.getData();
    print(data);
    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: data,);
    }));

    var condition= jsonDecode(data)["weather"][0]["id"];
    var temp = jsonDecode(data)["main"]["temp"];
    var cityName= jsonDecode(data)["name"];

    print(condition);
    print(temp);
    print(cityName);

  }

  // void expectedLessThan10(int n){
  //   if(n>10){
  //     throw 'Expected less than 10';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}