import 'package:flutter/material.dart';
import 'package:project_initiative_club_app/features/News/domain/entities/newsEntity.dart';
import 'package:project_initiative_club_app/features/News/presentation/widgets/news_card.dart';

class UsthbNews extends StatelessWidget {
  const UsthbNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewsEntity> entries = [
      NewsEntity(
          lastModification: DateTime.now(),
          coverImage:
              "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          images: [
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          ],
          title: "Recrutement au sein du club ouvert ! ",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
          likes: 20),
      NewsEntity(
          lastModification: DateTime.now(),
          coverImage:
              "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          images: [
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          ],
          title: "Recrutement au sein du club ouvert ! ",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
          likes: 20),
      NewsEntity(
          lastModification: DateTime.now(),
          coverImage:
              "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          images: [
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          ],
          title: "Recrutement au sein du club ouvert ! ",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
          likes: 20),
      NewsEntity(
          lastModification: DateTime.now(),
          coverImage:
              "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          images: [
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
            "https://cdn.pixabay.com/photo/2017/06/27/11/48/team-spirit-2447163_960_720.jpg",
          ],
          title: "Recrutement au sein du club ouvert ! ",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
          likes: 20)
    ];

    return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child:
                  NewsCard(color: Colors.blue.shade600, news: entries[index]));
        });
  }
}
