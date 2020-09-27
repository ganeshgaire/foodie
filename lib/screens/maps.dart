// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:foodie/api/serverapi.dart';
// import 'package:foodie/config/config.dart';
// import 'package:foodie/screens/navbarscreen.dart';
// import 'package:google_maps_place_picker/google_maps_place_picker.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

// class MapScreen extends StatefulWidget {
//   const MapScreen({Key key}) : super(key: key);

//   static final kInitialPosition = LatLng(27.6866, 83.4323);

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   PickResult selectedPlace;
//   double lat = 27.6866;
//   double lng = 83.4323;

//   TextEditingController nickname = TextEditingController();
//   TextEditingController deliveryInstructions = TextEditingController();
//   TextEditingController number = TextEditingController();

//   Future<void> _getCurrentLocation() async {
  
//     Position position =
//         await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       lat = position.latitude;
//       lng = position.latitude;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   // post address
//   Future<void> postAddress({var body}) async {
//     const Map<String, String> header = {
//       'Content-type': 'application/json',
//       'Accept': 'application/json',
//     };
//     var res = await http.post(
//       ServerApi.saveDeliveryAddresses,
//       headers: header,
//       body: body,
//     );
//     print(res.body);
//     if (res.statusCode == 200) {
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return NavBarScreen();
//       }));
//     } else {
//       throw "Can't add addresses.";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: PlacePicker(
//             apiKey: "AIzaSyACWA-RFcr_Lg9PZuss0p_TFKsUXusKtTg",
//             initialPosition: LatLng(lat, lng),
//             useCurrentLocation: true,
//             selectInitialPosition: true,
//             enableMyLocationButton: true,
//             forceSearchOnZoomChanged: true,
//             usePlaceDetailSearch: true,
//             region: 'ne',
//             onPlacePicked: (result) { 
//             print(result); 
//             Navigator.of(context).pop();
//           },
//             selectedPlaceWidgetBuilder:
//                 (_, selectedPlace, state, isSearchBarFocused) {
//               print("state: $state, isSearchBarFocused: $isSearchBarFocused");
//               return isSearchBarFocused
//                   ? Container()
//                   : FloatingCard(
//                       bottomPosition: 2.0,
//                       leftPosition: 0.0,
//                       rightPosition: 0.0,
//                       width: double.infinity,
//                       borderRadius: BorderRadius.circular(12.0),
//                       child: state == SearchingState.Searching
//                           ? Center(child: CircularProgressIndicator())
//                           : Container(
//                               height: 50,
//                               child: RaisedButton(
//                                 color: mainColor,
//                                 child: Text(
//                                   "Pick Here",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   print(selectedPlace.vicinity);
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) => Container(
//                                             height: 280,
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                     height: 50,
//                                                     alignment: Alignment.center,
//                                                     padding: const EdgeInsets
//                                                             .symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 10),
//                                                     margin: const EdgeInsets
//                                                             .symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 10),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[300],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10)),
//                                                     child: TextField(
//                                                       controller:
//                                                           deliveryInstructions,
//                                                       decoration:
//                                                           InputDecoration
//                                                               .collapsed(
//                                                         hintStyle: TextStyle(
//                                                             fontSize: 12),
//                                                         hintText:
//                                                             'near you eg. opposite to kalika school',
//                                                       ),
//                                                     )),
//                                                 Container(
//                                                     height: 50,
//                                                     alignment: Alignment.center,
//                                                     padding: const EdgeInsets
//                                                             .symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 10),
//                                                     margin: const EdgeInsets
//                                                             .symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 10),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[300],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10)),
//                                                     child: TextField(
//                                                       controller: number,
//                                                       decoration:
//                                                           InputDecoration
//                                                               .collapsed(
//                                                         hintStyle: TextStyle(
//                                                             fontSize: 12),
//                                                         hintText:
//                                                             'your contact number',
//                                                       ),
//                                                     )),
//                                                 Container(
//                                                     height: 50,
//                                                     alignment: Alignment.center,
//                                                     padding: const EdgeInsets
//                                                             .symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 10),
//                                                     margin: const EdgeInsets
//                                                             .symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 10),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[300],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10)),
//                                                     child: TextField(
//                                                       controller: nickname,
//                                                       decoration:
//                                                           InputDecoration
//                                                               .collapsed(
//                                                         hintStyle: TextStyle(
//                                                             fontSize: 12),
//                                                         hintText:
//                                                             'Home or Office',
//                                                       ),
//                                                     )),
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                           .symmetric(
//                                                       horizontal: 20),
//                                                   child: Container(
//                                                     height: 50,
//                                                     width: double.infinity,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10)),
//                                                     child: RaisedButton(
//                                                       color: mainColor,
//                                                       onPressed: ()  {
//                                                         var body = jsonEncode(<
//                                                             String, dynamic>{
//                                                           'delivery_area':
//                                                               selectedPlace
//                                                                   .vicinity,
//                                                           'complete_address':
//                                                               selectedPlace
//                                                                   .formattedAddress,
//                                                           'contact_no':
//                                                               number.text,
//                                                           'delivery_instructions':
//                                                               deliveryInstructions
//                                                                   .text,
//                                                           'latitude':
//                                                               selectedPlace
//                                                                   .geometry
//                                                                   .location
//                                                                   .lat,
//                                                           'longitude':
//                                                               selectedPlace
//                                                                   .geometry
//                                                                   .location
//                                                                   .lng,
//                                                           'nickname':
//                                                               nickname.text,
//                                                         });
//                                                         print(body);
//                                                          postAddress(
//                                                             body: body);
                                                      
//                                                       },
//                                                       child: Text(
//                                                         "Submit",
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ));
//                                 },
//                               ),
//                             ),
//                     );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
