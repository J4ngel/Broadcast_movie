import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class state_card extends StatelessWidget {
  String user;
  String state;
  DateTime day;
  
  state_card({
    required this.user,
    required this.state,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_circle),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(state)
                  ],
                ),
              )
            ),
            Text(
              DateFormat('EEEE').format(day).toString(), 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }
}