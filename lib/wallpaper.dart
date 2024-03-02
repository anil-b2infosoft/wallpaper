import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/fullscrren.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];
  int page = 1;
  fatchdata()async{

    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers:
        {'Authorization':'G3aEx6d1ubv4lrMU1k4BWcYXfEcZg6nuGIRwOPZ7oCBBEtJxpOkdmHha'}).then((value){
          Map result = jsonDecode(value.body);
          setState(() {
            images = result['photos'];
          });

    });
  }
  showmore() async {
    setState(() {
      page = page + 1;
    });
    String url = "https://api.pexels.com/v1/curated?per_page=100&page= "+ page.toString();
    await http.get(Uri.parse(url),
        headers:
        {'Authorization':'G3aEx6d1ubv4lrMU1k4BWcYXfEcZg6nuGIRwOPZ7oCBBEtJxpOkdmHha'}).then((value){
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
    });
  }
  @override
  void initState() {
    super.initState();
    fatchdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 2/3),
                  itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FullScreen(imageurl:
                    images[index]['src']['large2x'])));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Image.network(images[index]['src']['tiny'],fit: BoxFit.cover,),
                  ),
                );
              }),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              showmore();
            },
              child: Text("show more"),),
          )
        ],
      ),
    );
  }
}
?????

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';


class FullScreen extends StatefulWidget {
  final String imageurl;
  const FullScreen({super.key, required this.imageurl});


  @override
  State<FullScreen> createState() => _FullScrrenState();
}

class _FullScrrenState extends State<FullScreen> {
  Future<void> setwallpaper() async{
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Image.network(widget.imageurl),
              )
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: (){
                setwallpaper();
                Fluttertoast.showToast(
                  msg: "Wallpaper added successfully",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              },
              child: Text("Set Wallpaper"),
            ),
          )
        ],
      ),
    );
  }
}
