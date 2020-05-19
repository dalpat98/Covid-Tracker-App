import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mappage extends StatefulWidget {
  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  List overviewdata = [];

  @override
  Widget build(BuildContext context) {
    overviewdata = overviewdata.isNotEmpty
        ? overviewdata
        : ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Maps',
            style: TextStyle(
              fontFamily: 'BalooTamma2',
              fontSize: 25.0,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[900],
        ),
        body: MapBody(
          overviewdata: overviewdata,
        ),
      ),
    );
  }
}

class MapBody extends StatefulWidget {
  final List overviewdata;
  MapBody({this.overviewdata});
  @override
  _MapBodyState createState() => _MapBodyState(overviewdata: overviewdata);
}

class _MapBodyState extends State<MapBody> {
  List overviewdata;
  _MapBodyState({this.overviewdata});

  MapType _mapType = MapType.hybrid;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(20.593684, 78.96288),
    zoom: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      for (int i = 0; i < overviewdata[1].length; i++) {
        final MarkerId markerId = MarkerId((markers.length + 1).toString());

        LatLng markerPos = LatLng(overviewdata[0][overviewdata[1][i]][0],
            overviewdata[0][overviewdata[1][i]][1]);
        final Marker marker = Marker(
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            markerId: markerId,
            infoWindow: InfoWindow(
              title: "${overviewdata[1][i]}",
              snippet:
                  "Confirmed: ${overviewdata[0][overviewdata[1][i]][2]} Dead: ${overviewdata[0][overviewdata[1][i]][3]} Recovered: ${overviewdata[0][overviewdata[1][i]][4]}",
            ),
            position: markerPos);
        markers[markerId] = marker;
      }
      setState(() {});
    }

    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationEnabled: true,
          mapType: _mapType,
          markers: Set<Marker>.of(markers.values),
          initialCameraPosition: _kInitialPosition,
          onMapCreated: _onMapCreated,
        ),
      ],
    );
  }
}
