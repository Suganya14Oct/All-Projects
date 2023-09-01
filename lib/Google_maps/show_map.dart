import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ShowSimpleMap extends StatefulWidget {

  @override
  State<ShowSimpleMap> createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {

  GoogleMapController? googleMapController;

  static final LatLng _center = LatLng(45.521563, -122.677433);
  static final LatLng _anotherLocation = LatLng(45.509244, -122.677476);

  void _onMapCreated(GoogleMapController controller){
     // mapController = controller;
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps")
      ),
      body: GoogleMap(
        markers: {portLandMarker, portLandMarkerTwo},
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,zoom: 11.0,
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(onPressed: _goToIntel, label: Text("Intel Corp"),
        icon: Icon(Icons.place),
      ),
    );
  }

  static final CameraPosition intelPosition = CameraPosition(target: LatLng(45.5418295, -122.9170456),zoom: 19.780,bearing: 191.789,tilt: 34.89);

  Future<void> _goToIntel() async {
    final GoogleMapController? controller = await googleMapController;
    controller!.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
}

  Marker portLandMarker = Marker(markerId: MarkerId("Portland"),
  position: _center,
    infoWindow: InfoWindow(title: "Portland",snippet: "This is a great Town!!..."),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );

  Marker portLandMarkerTwo = Marker(markerId: MarkerId("Portland"),
      position: _anotherLocation,
      infoWindow: InfoWindow(title: "Portland Area",snippet: "This is a great Town!!..."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );

}
