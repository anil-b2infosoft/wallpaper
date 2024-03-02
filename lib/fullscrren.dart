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
