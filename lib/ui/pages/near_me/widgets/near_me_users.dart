import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Near_me_users extends StatelessWidget {
  String name;
  String latitude;
  String longitude;

  Near_me_users({
    required this.name,
    required this.latitude,
    required this.longitude
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        onPressed: (latitude.isNotEmpty && longitude.isNotEmpty)?()async{
          final url = "https://www.google.com/maps?q=${latitude},${longitude}";
          await launch(url);
        }:null, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Icon(Icons.place)
          ],
        )
      ),
    );
  }
}