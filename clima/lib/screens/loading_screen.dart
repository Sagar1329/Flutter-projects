import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hi");

    geo_locateData();
    print("bye");
  }

  void geo_locateData() async {
    print("kkkk");
    WeatherModel weatherdata = WeatherModel();
    var dat = await weatherdata.getLocationWeather();
    print("DID I FUCK UP HERE");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(dat);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SpinKitThreeInOut(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
