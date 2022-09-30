import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class CovertLatLongToAddress extends StatefulWidget {
  const CovertLatLongToAddress({Key? key}) : super(key: key);

  @override
  State<CovertLatLongToAddress> createState() => _CovertLatLongToAddressState();
}

class _CovertLatLongToAddressState extends State<CovertLatLongToAddress> {

  String stAddress='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoogleMaps'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          GestureDetector(
            onTap: ()async{
              final query = "1600 Amphiteatre Parkway, Mountain View";
              var addresses = await Geocoder.local.findAddressesFromQuery(query);
              var second = addresses.first;
              print("${second.featureName} : ${second.coordinates}");

              final coordinate=new Coordinates(20.5937, 78.9629);
              var address=await Geocoder.local.findAddressesFromCoordinates(coordinate);
              var first=address.first;
              print("Address"+first.featureName.toString()+first.addressLine.toString());
              setState((){
                    stAddress=first.featureName.toString()+" "+first.addressLine.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.teal),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
