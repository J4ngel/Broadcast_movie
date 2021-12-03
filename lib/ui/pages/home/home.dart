import 'package:broadcast_movie/models/theme_preferences.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/home/widgets/card_movie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: currentTheme.isDarkTheme()
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              const Text('Material App Bar'),
              Container(
                margin: const EdgeInsets.only(
                  left: 150.0,
                ),
                child: Switch(
                    value: currentTheme.isDarkTheme(),
                    onChanged: (value) {
                      String newTheme =
                          value ? ThemePreference.DARK : ThemePreference.LIGHT;
                      currentTheme.setTheme = newTheme;
                    }),
              )
            ],
          ),
          backgroundColor: currentTheme.isDarkTheme()
              ? const Color(0xff085373)
              : const Color(0xff711A1A),
        ),
        
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top:16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size:20
                  ),
                  filled:true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color:Colors.grey.shade100)
                  )
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: ListView(
                    children: [
                      card_movie(img: "url", title: "title", year: "year", info: "infoadsaisodjaosjidaoisjdoasjdoaijsdoiajsoidjaosidjasiojdoiasjdoi"),
                      card_movie(img: "url", title: "title", year: "year", info: "info")
                      ],
                  ),
                )
              )
            ],
          ),
        )
    );
  }
}
