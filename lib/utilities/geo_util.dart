import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const _earthRadius = 6378137;

// https://www.movable-type.co.uk/scripts/latlong.html
LatLng _getEndPoint(LatLng startPoint, double bearing, double distance) {
  final angularDistance = distance / _earthRadius;
  final startPointLatitudeRadians = _degreeToRadians(startPoint.latitude);
  final startPointLongitudeRadians = _degreeToRadians(startPoint.longitude);
  final bearingRadians = _degreeToRadians(bearing);
  double latitude = asin(sin(startPointLatitudeRadians) * cos(angularDistance) +
      cos(startPointLatitudeRadians) * sin(angularDistance) * cos(bearingRadians));
  double longitude = startPointLongitudeRadians +
      atan2(sin(bearingRadians) * sin(angularDistance) * cos(startPointLatitudeRadians),
          cos(angularDistance) - sin(startPointLatitudeRadians) * sin(latitude));
  latitude = _radiansToDegree(latitude);
  longitude = _radiansToDegree(longitude);
  longitude = (longitude + 540) % 360 - 180;
  return LatLng(latitude, longitude);
}

// https://www.mathsisfun.com/geometry/radians.html
double _degreeToRadians(double degree) {
  return degree * pi / 180;
}

// https://www.mathsisfun.com/geometry/radians.html
double _radiansToDegree(double radians) {
  return radians * 180 / pi;
}

LatLngBounds getBoundsOfRadius(LatLng center, double radiusInMeter) {
  final northEast = _getEndPoint(center, 45, radiusInMeter);
  final southWest = _getEndPoint(center, 225, radiusInMeter);
  return LatLngBounds(southwest: southWest, northeast: northEast);
}

double getDistance({
  required double startLatitude,
  required double startLongitude,
  required double endLatitude,
  required double endLongitude,
}) {
  return Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
}
