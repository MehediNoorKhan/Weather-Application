import 'package:flutter/material.dart';
import '../services/network.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Lonlan extends StatefulWidget {
  final double latitude;
  final double longitude;

  Lonlan({
    required this.latitude,
    required this.longitude,
  });

  @override
  State<StatefulWidget> createState() {
    return _LonlanScreenState();
  }
}

class _LonlanScreenState extends State<Lonlan> {
  @override
  void initState() {
    super.initState();
    getLatlonData(widget.latitude, widget.longitude);
  }

  void getLatlonData(double latitude, double longitude) async {
    var weatherData = await getCityWeatherlonglan(latitude, longitude);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  Future<dynamic> getCityWeatherlonglan(
      double latitude, double longitude) async {
    final String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=247d2898a61c28541b150bedd751fabe&units=metric"; //This is My API. Change to yours.
    NetworkHelper networkHelper = NetworkHelper('$weatherUrl');
    print('Latitude: $latitude, Longitude: $longitude');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.09),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
