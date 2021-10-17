import 'package:flutter/material.dart';
import 'package:godweb/domain/songs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Список песен'),
          leading: Icon(Icons.queue_music_outlined),

        ),
        body: SongsList(),
      ),
    );
  }
}


class SongsList extends StatelessWidget {

  final songs = <Song>[
    Song(title: 'Орлы', author: 'Слово Жизни', level: 'High'),
    Song(title: 'Я Твое отражение', author: 'Вита Заболева', level: 'Medium'),
    Song(title: 'King of my heart', author: 'Bethel Music', level: 'Easy'),
    Song(title: 'River', author: 'Planetshakers', level: 'Medium'),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, i){
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(color:Color.fromRGBO(50, 65, 85, 0.7)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right:12),
                      child: Icon(Icons.music_note_outlined, color: Theme.of(context).textTheme.headline6!.color,),
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(width: 1, color: Colors.white24)),

                      ),
                    ),
                    title: Text(songs[i].title, style: TextStyle(color: Theme.of(context).textTheme.headline6!.color, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).textTheme.headline6!.color),
                    subtitle: subtitle(context, songs[i]),
                  ),
                ),
              );

            }),

      ),
    );
  }
}


Widget subtitle(BuildContext context, Song song)
{
  var color = Colors.grey;
  double indicatorLevel = 0;
  switch(song.level){
    case  'Easy':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case  'Medium':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case  'High':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.headline6!.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10,),
      Expanded(
          flex: 3,
          child: Text(song.level, style: TextStyle(color: Theme.of(context).textTheme.headline6!.color),)),
      Expanded(
          flex: 5,
          child: Text(song.author, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.normal ),))
    ],
  );
}