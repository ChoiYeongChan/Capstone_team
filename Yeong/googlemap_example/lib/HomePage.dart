import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// list of locations to display polylines
List<LatLng> latLen = [
  const LatLng(37.507941, 127.009686),
  const LatLng(37.302263, 126.977977)
];


double longitudeCalculate() {
  double cameraLongitude=0.0;
  for(int i=0; i<latLen.length; i++) {
    cameraLongitude+=latLen[i].longitude;
  }
  cameraLongitude/=latLen.length;
  return cameraLongitude;
}

double latitudeCalculate() {
  double cameraLatitude=0.0;
  for(int i=0; i<latLen.length; i++) {
    cameraLatitude+=latLen[i].latitude;
  }
  cameraLatitude/=latLen.length;
  return cameraLatitude;
}

Future<Post> fetchPost() async {
  final response =
  await http.get(Uri.parse("https://maps.googleapis.com/maps/api/directions/json?origin=${latLen[0].latitude},${latLen[0].longitude}&destination=${latLen[1].latitude},${latLen[1].longitude}&key=AIzaSyAHDQmRKK6kCswf8KISuwGB-zK9aqwC7ug"));
  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class _HomePageState extends State<HomePage> {

  // created controller to display Google Maps
  Completer<GoogleMapController> _controller = Completer();
  //on below line we have set the camera position
  static final CameraPosition _kGoogle = CameraPosition(
    target: LatLng(latitudeCalculate(), longitudeCalculate()),
    zoom: 12,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // declared for loop for various locations
    for(int i=0; i<latLen.length; i++){
      _markers.add(
        // added markers
          Marker(
            markerId: MarkerId(i.toString()),
            position: latLen[i],
            infoWindow: InfoWindow(
              title: '관광지',
              snippet: '관광지',
            ),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
      setState(() {

      });
      _polyline.add(
          Polyline(
            polylineId: const PolylineId('1'),
            width: 5,
            points: latLen,
            color: Colors.green,
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // title of app
        title: Text("Google Map Example"),
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            //given camera position
            initialCameraPosition: _kGoogle,
            // on below line we have given map type
            mapType: MapType.normal,
            // specified set of markers below
            markers: _markers,
            // on below line we have enabled location
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            // on below line we have enabled compass location
            compassEnabled: true,
            // on below line we have added polylines
            polylines: _polyline,
            // displayed google map
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}

