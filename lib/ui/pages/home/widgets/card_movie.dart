import 'package:flutter/material.dart';

class card_movie extends StatelessWidget {
  String img;
  String title;
  String year;
  String info;
  
  card_movie({
    required this.img,
    required this.title,
    required this.year,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 120,height: 200, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(year, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(info)],
                ),
            )
            ), 
            IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye))
          ],
        ),
      ),
    );
  }
}