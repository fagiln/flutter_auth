import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: Icon(Icons.extension), onPressed: () {})
              ],
            ),
            SizedBox(height: 37),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Welcome, \n",
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                  TextSpan(
                    text: auth.currentUser!.email,
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Search"),
            ),
            SizedBox(height: 10),
            Text(
              "Recomended Place",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Container(
                child: ElevatedButton(
              onPressed: () {
                _signOut().then((value) => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginScreen())));
              },
              child: Text('Logout'),
            )),
          ],
        ),
      ),
    );
  }
}

final countries = ["Tokyo", "Berlin", "Roma", "Monas"];


// class LocationWithGeo extends StatefulWidget {
//   const LocationWithGeo({super.key});

//   @override
//   State<LocationWithGeo> createState() => _LocationWithGeoState();
// }

// class _LocationWithGeoState extends State<LocationWithGeo> {
//   String location = 'Belum Mendapatkan Lat dan long, Silahkan tekan button';
//   String address = 'Mencari lokasi...';

//   //getLongLAT
//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     //location service not enabled, don't continue
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location service Not Enabled');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permission denied');
//       }
//     }
//     //permission denied forever
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permission denied forever, we cannot access',
//       );
//     }
//     //continue accessing the position of device
//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Koordinat Point',
//             style: TextStyle(
//               fontSize: 22.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Text(
//             location,
//             style: TextStyle(
//               fontSize: 12.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               Position position = await _getGeoLocationPosition();
//               setState(() {
//                 location = '${position.latitude}, ${position.longitude}';
//               });
//               print(location);
//             },
//             child: const Text('Get Koordinat'),
//           ),
//         ],
//       ),
//     );
//   }
// }
