import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:mongsil/Api/PostLocation.dart';

import 'package:flutter/material.dart';
import 'package:mongsil/ChildPage/Bluetooth/model/sensor_data.dart';

class SensorView extends StatefulWidget {
  final SensorData sensorData;
  SensorView(this.sensorData, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SensorViewState();
  }
}

class _SensorViewState extends State<SensorView> {
  Position _currentPosition;
  Timer timer;

  @override
  void initState() {
    super.initState();
    // TODO final code
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) {
      _getCurrentLocation();
      postLocation(
        _currentPosition.latitude,
        _currentPosition.longitude,
        widget.sensorData.name,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Sensor name : '),
            subtitle: Text(
                '${widget.sensorData.name} rssi : ${widget.sensorData.name}'),
            trailing: Icon(Icons.signal_cellular_4_bar),
          ),
        ],
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
