import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {

  LatLng _currentPosition=const LatLng(18.5204,73.8567);
  String _address="Searching...";


  Future<void> _getAddress(LatLng position)async{
    try{  
      List<Placemark> placemarks=await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place=placemarks[0];
      setState(() {
        _address="${place.name} , ${place.subLocality} , ${place.locality}";
      });
    }catch (e){
      setState(() {
        _address="Unknown Location";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("Select Location")
      ),
      body:Stack(
        children:[
          GoogleMap(
            initialCameraPosition:CameraPosition(target:_currentPosition,zoom:15),
            onCameraMove:(position)=>_currentPosition=position.target,
            onCameraIdle: ()=>_getAddress(_currentPosition),
           ),
           const Center(child: Icon(Icons.location_on,color: Colors.red,size: 40,),),
           Positioned(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_address,textAlign: TextAlign.center,),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: ()=>Navigator.pop(context,_address), 
                      child: const Text("Confirm Location")
                    )
                  ],
                ),
              ),
            )
           )

        ]

      )
    );
  }
}