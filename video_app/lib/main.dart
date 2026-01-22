import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoScreen(),
    );
  }
}

// ---------------- VIDEO SCREEN ----------------

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  final YoutubePlayerController _youtubeController =
      YoutubePlayerController();

  @override
  void initState() {
    super.initState();

    // VIDEO YOUTUBE (del enlace que has puesto)
    _youtubeController.loadVideoById(videoId: "rvm-AhGdOmE");
  }

  @override
  void dispose() {
    _youtubeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube + Vimeo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10),
            const Text(
              "Video Youtube",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            YoutubePlayer(
              controller: _youtubeController,
              aspectRatio: 16 / 9,
            ),

            const SizedBox(height: 30),

            const Text(
              "Video Vimeo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

           
            
          ],
        ),
      ),
    );
  }
}
