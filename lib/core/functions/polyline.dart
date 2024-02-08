import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;

Future<Set<Polyline>> getPolyLine(lat, long, destlat, destlong) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // String url =
  //     "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyDqLLE19QhjqQI5D_PtFndsUKbkWif8q9I";
  // var respose = await http.post(Uri.parse(url));
  // var responsebody = jsonDecode(respose.body);
  // print(
  //     "================================responsebody======================================");
  // print(responsebody);
  // var point = responsebody['routes'][0]['overview_polyline']['points'];
  // print(
  //     "================================after point======================================");
  // print(point);
  List<PointLatLng> result =
      polylinePoints.decodePolyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@");
  // List<PointLatLng> result = polylinePoints.decodePolyline(point);
  print(
      "================================result======================================");
  print(result);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
  print(
      "================================polylineco======================================");
  print(polylineco);
  Polyline polyline = Polyline(
      polylineId: PolylineId("ahmad"),
      color: Colors.red,
      width: 5,
      points: polylineco);
  print(
      "================================polyline======================================");
  print(polyline.points);
  polylineSet.add(polyline);
  // print(
  //     "================================polylineSet======================================");
  // print(polylineSet.toList()[0]);
  // print(polylineSet.toList()[1]);
  // print(polylineSet.toList()[0].color);
  // print(polylineSet.toList()[0].consumeTapEvents);
  // print(polylineSet.toList()[0].endCap);
  // print(polylineSet.toList()[0].geodesic);
  // print(polylineSet.toList()[0].jointType);
  // print(polylineSet.toList()[0].onTap);
  // print(polylineSet.toList()[0].patterns);
  // print(polylineSet.toList()[0].polylineId);
  // print(polylineSet.toList()[0].startCap);
  // print(polylineSet.toList()[0].visible);
  // print(polylineSet.toList()[0].zIndex);
  return polylineSet;
}
