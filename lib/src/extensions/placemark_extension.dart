import 'package:geocoding/geocoding.dart';

extension PlacemarkExtention on Placemark {
  String toDisplayString() {
    return "$street, $locality, $subAdministrativeArea, $administrativeArea, $postalCode, $country";
  }
}
