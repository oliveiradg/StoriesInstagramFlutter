import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late VideoPlayerController _videoPlayerController;
  bool isVideoInitialized = false;
  bool isShowStory = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) => setState(() {
            isVideoInitialized = true;
          }))
      ..play()
      ..setLooping(true);

    super.initState();
  }

  void _onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {}

  double _getStoryVideoHeight(double deviceHeight) {
   if(isShowStory){
      return deviceHeight - 100;
   }else {
    return deviceHeight - 55;
   }
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      
        body: GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: paddingTop + 12,
                  left: 8,
                  height: _getStoryVideoHeight(deviceHeight),
                  right: 8,
                  child: isVideoInitialized
                      ? VideoPlayer(_videoPlayerController)
                      : const SizedBox.shrink()),
            ],
          ),
        ));
  }
}
