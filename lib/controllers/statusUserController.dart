import 'package:broadcast_movie/data/models/statusUserModel.dart';
import 'package:get/get.dart';

class dataStatusUserTemp extends GetxController {
  List<statusUserModel> statusUser = [
    statusUserModel(
        name: "Tim Burton",
        messageText: "Watching Encanto",
        imageURL: "https://randomuser.me/api/portraits/men/10.jpg",
        time: "Now"),
    statusUserModel(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
    statusUserModel(
        name: "James Green",
        messageText: "Boring...",
        imageURL: "https://randomuser.me/api/portraits/men/12.jpg",
        time: "1 h"),
    statusUserModel(
        name: "Philip Fox",
        messageText: "I love Colombia",
        imageURL: "https://randomuser.me/api/portraits/men/13.jpg",
        time: "3 h"),
    statusUserModel(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "https://randomuser.me/api/portraits/men/14.jpg",
        time: "23 Nov"),
    statusUserModel(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "https://randomuser.me/api/portraits/men/15.jpg",
        time: "17 Nov"),
    statusUserModel(
        name: "Andres ",
        messageText: "Can you please share the file?",
        imageURL: "https://randomuser.me/api/portraits/men/16.jpg",
        time: "1 Nov"),
    statusUserModel(
        name: "Jhon Jairo Perez",
        messageText: "Ja ja ja ja viendo el águila descalza",
        imageURL: "https://randomuser.me/api/portraits/men/17.jpg",
        time: "18 Feb"),
    statusUserModel(
        name: "Tim Burton",
        messageText: "Watching Coco",
        imageURL: "https://randomuser.me/api/portraits/men/10.jpg",
        time: "1 Ene"),
  ].obs;
}
