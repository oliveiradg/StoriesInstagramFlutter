import 'package:flutter/material.dart';
import 'package:instagram_stories/widgets/icon_with_text_widget.dart';
import 'package:instagram_stories/widgets/triangle_widget.dart';
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

  void _onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.delta.dy < 0.7) {
      setState(() {
        isShowStory = false;
      });
    } else {
      setState(() {
        isShowStory = true;
      });
    }
  }

  double _getStoryActivityDetails(double deviceHeight) {
    if (isShowStory) {
      return 0;
    } else {
      return deviceHeight * 0.8;
    }
  }

  double _getStoryVideoHeight(double deviceHeight) {
    if (isShowStory) {
      return deviceHeight - 140;
    } else {
      return deviceHeight * 0.2 - 70;
    }
  }

  double _getStoryVideoWidth(double deviceWidth) {
    if (isShowStory) {
      return deviceWidth - 16;
    } else {
      return deviceWidth * 0.2 - 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    const animatedDuration = Duration(milliseconds: 300);
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: animatedDuration,
              top: paddingTop + 12,
              width: _getStoryVideoWidth(deviceWidth),
              height: _getStoryVideoHeight(deviceHeight),
              child: isVideoInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: VideoPlayer(_videoPlayerController))
                  : const SizedBox.shrink(),
            ),
             if (isShowStory)
              Positioned(
                top: paddingTop + 28,
                left: 16,
                child: const Icon(Icons.settings,
                    color: Colors.white, size: 24),),
            if (isShowStory)
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
            //close icon
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
            if (isShowStory)
              Positioned(
                bottom: 0,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(children: const [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/ironman.png'),
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://fumettologica.it/wp-content/uploads/2019/05/hulk-film.jpg'),
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://epipoca.com.br/wp-content/uploads/2022/04/doutor-estranho-19042022.jpg'),
                          ),
                        ]),
                        const Text(
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
                        IconWithTextWidget(
                            icon: Icons.more_horiz, text: 'Mais'),
                      ],
                    ),
                  ],
                ),
              ),

            AnimatedPositioned(
              duration: animatedDuration,
              curve: Curves.easeIn,
              left: 0,
              right: 0,
              bottom: -26,
              height: _getStoryActivityDetails(deviceHeight),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  const Positioned(
                    top: -12,
                    height: 20,
                    child: TriangleWidget(),
                  ),
                  Container(
                    color: Color.fromRGBO(33, 33, 33, 1),
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('25',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ))
                            ],
                          ),
                          const Divider(),
                          const Text(
                            'Visualizações',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ...List.generate(
                            25,
                            (_) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: const [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://uploads.jovemnerd.com.br/wp-content/uploads/2023/01/marvels_avengers_encerra_atualizacoes_suporte__m2s8t2a30-1210x544.jpg'),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  'Avengers',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],

                                ),
                               Row(children: const[
                                Icon(Icons.more_horiz,
                                color: Colors.white,
                                size: 24,
                                ),
                                   SizedBox(
                                              width: 8,
                                            ),
                                Icon(Icons.messenger,
                                color: Colors.white,
                                size: 24,
                                ),

                               ],) ,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
