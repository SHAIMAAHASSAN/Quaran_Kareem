import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:quaran_kareem/model/suar.dart';
import 'package:quaran_kareem/model/suramodel.dart';
class SuraCard extends StatefulWidget {
  final int id;
  final int length;
  final String title;
  final String subTitle;

   SuraCard( this.title,this.subTitle,this.id, this.length, {super.key});
  @override
  State<SuraCard> createState() => _SuraCardState();
}

class _SuraCardState extends State<SuraCard> {
  bool isPlaying = false;

 late AssetsAudioPlayer assetsAudioPlayer;
 

  @override
  void initState() {
  assetsAudioPlayer = AssetsAudioPlayer.withId(widget.id.toString());
  assetsAudioPlayer.open(Playlist(audios:[Audio(suar[widget.id].audio)] ),autoStart: false);
   audiListenerTrigger();
    // TODO: implement initState
    super.initState();
  }
  void audiListenerTrigger() {
    assetsAudioPlayer.playlistFinished.listen((event) {
      if (event) {
        isPlaying = false;
        setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.deepPurple[100],
        leading: CircleAvatar(backgroundImage:AssetImage ( "assets/images/download.jpeg",),),
        title: Text(widget.title),
        subtitle: Text(widget.subTitle),
        trailing: IconButton(icon: (isPlaying) ? Icon(Icons.pause) : Icon(Icons.play_arrow),onPressed: (){
          if (assetsAudioPlayer.isPlaying.value) {
            assetsAudioPlayer.pause();
          } else {
            for (var i = 0; i < widget.length; i++) {
              var closedAssetAudioPlayer =
              AssetsAudioPlayer.withId(i.toString());
              if (closedAssetAudioPlayer.isPlaying.value) {
                closedAssetAudioPlayer.stop();
              }
            }

            assetsAudioPlayer.play();
          }

          setState(() {
            isPlaying = !isPlaying;
          });

        },),

      ),
    );
  }
}
