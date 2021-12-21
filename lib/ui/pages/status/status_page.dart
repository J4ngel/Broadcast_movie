import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/data/models/state_model.dart';
import 'package:broadcast_movie/data/services/state_service.dart';
import 'package:broadcast_movie/ui/pages/status/widgets/state_card.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chat/widgets/conversionList.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);
  final state_service = State_service();

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _status_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();

    return Scaffold(
      backgroundColor: controller.darkMode
          ? const Color(0XFF262D31)
          : const Color(0XFFCFCFCF),
      appBar: AppBar(
        backgroundColor: controller.darkMode
            ? const Color(0xff085373)
            : const Color(0xff711A1A),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Estados',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffFFFFFF)),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: TextField(
                    maxLength: 35,
                    keyboardType: TextInputType.text,
                    controller: _status_controller,
                    onChanged: (text)=> setState((){}),
                    onSubmitted: (input){_update_state();},
                    decoration: InputDecoration(
                      hintText: "Escribe aquí tu nuevo estado...",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(Icons.keyboard,
                          color: Colors.grey.shade600, size: 20),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: controller.darkMode
                                  ? Colors.grey.shade100
                                  : Color(0xff711A1A)))
                    ),
                  )
                ),
                IconButton(
                  onPressed: (){_update_state();}, 
                  icon: (_status_controller.text.length>0)?Icon(Icons.star_outlined)
                                                          :Icon(Icons.star_outline_sharp),
                          color: controller.darkMode? Colors.white: Colors.black,
                )
              ]
            ),
            _get_states()
          ],
        ),
      )
    );
  }

  void _update_state(){
    if(_status_controller.text.length>0){
      final state = State_model("Mi estado", _status_controller.text, DateTime.now());
      widget.state_service.save_state(state);
      _status_controller.clear();
      setState(() {});
    }
  }

  Widget _get_states(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FirebaseAnimatedList(
          controller: _scrollController,
          query: widget.state_service.get_states(), 
          itemBuilder: (context, snapshot, animation, index){
            final json = snapshot.value as Map<dynamic, dynamic>;
            final states = State_model.fromJson(json);
            return state_card(user: states.name, state: states.state, day: states.day);
          }
        ),
      )
    );
  }
}
