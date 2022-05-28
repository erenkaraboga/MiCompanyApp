

import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final Uri _url = Uri.parse('https://github.com/erenkaraboga');
  late YoutubePlayerController _controller;
  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void initState() {
   const  url = "https://www.youtube.com/watch?v=rIUThvxtVVM&t=5s";
    _controller = YoutubePlayerController(
    initialVideoId:YoutubePlayer.convertUrlToId(url)! ,
    flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.fitWidth,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
    body: SingleChildScrollView(
      child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              shadowColor: Colors.grey,
              child: InkWell(
                borderRadius: BorderRadius.circular(25.0),
                onTap: (){
                },
                child: ListTile(
                    leading:  CircleAvatar(radius: (30),
                        backgroundColor: Colors.white,
                        child: ClipOval(

                          child: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.cover,),
                        )
                    ),
                    subtitle: Text(user.email.toString()),
                    title: Text("Admin")
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  InkWell(child: buildListTile(Icon(CupertinoIcons.person),"Profil"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: (){},

                  ),
                  InkWell(child: buildListTile(Icon(CupertinoIcons.lock),"Güvenlik"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: (){
                    },),
                  InkWell(child: buildListTile(Icon(CupertinoIcons.bell),"Bildirimler"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: (){
                    },),
                  InkWell(child: buildListTile(Icon(CupertinoIcons.bluetooth),"Bluetooth"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: (){
                      AppSettings.openBluetoothSettings();
                    },) ,
                  ],
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  InkWell(child: buildListTileScoren(Icon(Icons.lightbulb_outline), "Deneysel Ürünler", "Scoren"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: ()=>openYoutubeDialog(),),
                ],
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  InkWell(child: buildListTile(Icon(Icons.help_outline_outlined),"Yardım"),
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: ()=>_launchUrl(),),
                  InkWell(child: buildListTile(Icon(Icons.star_outline_outlined),"Değerlendir"),
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: ()=>openRateDialog(),
                  ),
                  InkWell(child: buildListTile(Icon(Icons.power_settings_new_outlined),"Çıkış yap"),
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: (){
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
      ),
    )
    );
  }

  Widget buildYoutubee()=>YoutubePlayerBuilder(player: YoutubePlayer(controller: _controller,
    showVideoProgressIndicator: true,
    progressIndicatorColor:Colors.amber,
    progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent
    ),
  ), builder: (context,player)=>Container(
    child: player,
  )
  );
  openYoutubeDialog()=> showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => buildYoutubee(),
  );
  Widget buildRatingg()=>RatingDialog(
    initialRating: 1.0,
    title: Text(
      'Puanla!',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Yıldıza tıkla ve puanla. İstersen yorum yapabilirsin!',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image: Image.asset('assets/images/aygunlogo.jpg',fit: BoxFit.fitWidth,
      width: 150,
      height: 75,
    ),

    submitButtonText: 'Gönder',
    submitButtonTextStyle: TextStyle(
      color: Colors.grey.shade800,
      fontSize: 20,
      fontWeight:  FontWeight.bold
    ),
    commentHint: 'Yorumunuz...',
    starColor: Colors.red
    ,
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
    },
  );
  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
  openRateDialog()=> showDialog(
   context: context,
   barrierDismissible: true, // set to false if you want to force a rating
   builder: (context) => buildRatingg(),
 );
  ListTile buildListTile(Icon icon ,String name) {
    return ListTile(
      trailing: Icon(CupertinoIcons.chevron_forward),
      leading:  Container(
                  height: double.infinity,
                  child: icon,
                 ),
                 title: Text(name),);
  }
  ListTile buildListTileScoren(Icon icon ,String name,String subTitle) {
    return ListTile(
      subtitle: Text(subTitle,style: TextStyle(
        fontWeight: FontWeight.bold
      ),),
      trailing: Icon(CupertinoIcons.chevron_forward),
      leading:  Container(
        height: double.infinity,
        child: icon,
      ),
      title: Text(name),);
  }
}
