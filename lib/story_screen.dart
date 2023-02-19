import 'package:flutter/material.dart';
import 'package:instagram_stories/widgets/icon_with_text_widget.dart';
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
    if (isShowStory) {
      return deviceHeight - 140;
    } else {
      return deviceHeight - 70;
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
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
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: VideoPlayer(_videoPlayerController))
                  : const SizedBox.shrink(),
            ),
            Positioned(
              top: paddingTop + 28,
              left: 16,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Y4WTZoSQ4K92ab8op04Isc18lGUT4zScFECkauw0uABHCHk3RbbPfRssHpf_trEfsrw&usqp=CAU'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'Homem Aranha',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: '  3h',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                      //
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'Boomerang',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: ' by Instagram >',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: paddingTop + 28,
              right: 16,
              child: Row(
                children: const [
                  Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              
              bottom: 0,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children:  [
                      Row(
                       
                        
                        children: const [
                          
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/ironman.png'),
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://fumettologica.it/wp-content/uploads/2019/05/hulk-film.jpg'),
                      ),
                      CircleAvatar(
                        backgroundImage:
                           NetworkImage('https://portalpopline.com.br/wp-content/uploads/2021/12/refilmagens-doutor-estranho-no-multiverso-da-loucura-marvel.jpg?w=640'),
                      ),
                        ]
                      ),

                    const  Text(
                        'Atividade',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      IconWithTextWidget(
                          icon: Icons.facebook, text: 'facebook'),
                      SizedBox(
                        width: 20,
                      ),
                      IconWithTextWidget(
                          icon: Icons.favorite_outline_outlined,
                          text: 'Destacar'),
                      SizedBox(
                        width: 20,
                      ),
                      IconWithTextWidget(icon: Icons.more_horiz, text: 'Mais'),
                 
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
