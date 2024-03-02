import 'package:flutter/material.dart';
import 'package:wallpaper_app/Splashscreen.dart';
import 'package:wallpaper_app/log_in_screen.dart';
import 'package:wallpaper_app/wallpaper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      brightness: Brightness.dark
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Wallpaper"),
        
      ),
      body: Column(
        children: [
          InkWell(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    height: 200,
                    width: 280,
                    child: Center(child: Image.network("https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?",
                      //colorBlendMode: BlendMode.color,
                      fit: BoxFit.cover,)),
                  ),
                  Text("Piexel Perfect",style: TextStyle(fontSize: 30,color: Colors.white, fontStyle: FontStyle.italic ),)
                ],
                ),
              ],
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Wallpaper()));
            },
          ),
    Align(
    alignment: Alignment.center,
    widthFactor: .0,
    heightFactor: 1.5,
    child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    child: Center(
    child: Text('Aligned Widget'),
    ),
    ),
    )
        ],
      )
    );
  }
}
