import 'package:broadcast_movie/data/models/feedUserModel.dart';
import 'package:get/get.dart';

class dataFeedUserTem extends GetxController {
  List<FeedUsers> feedUsers = [
    FeedUsers(
        name: "Tim Burton",
        messageText: "Watching Encanto",
        imageURL: "https://randomuser.me/api/portraits/men/10.jpg",
        time: "Now"),
    FeedUsers(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
    FeedUsers(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
    FeedUsers(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
  ].obs;
}
