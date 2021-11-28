import 'package:broadcast_movie/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class location_list extends StatefulWidget {
  String name;
  String address;
  
  location_list({
    required this.name,
    required this.address
  });

  @override
  _location_listState createState() => _location_listState();
}

class _location_listState extends State<location_list> {
  @override
  Widget build(BuildContext context) {
  final currentTheme = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), 
                        color: currentTheme.isDarkTheme() 
                          ? Color(0xff085373)
                          :Color(0xff711A1A)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Dirección: "+widget.address,
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xffFFFFFF)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}