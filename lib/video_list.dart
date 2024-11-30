import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

List song = [
  {
    "title": "يابعدهم ",
    "singer": "عبدالمجيد",
    "id": "06sZL2yln5w",
    "thumbnail": "songs/majeed.gif"
  },
  {
    "title": "يا مستجيب للداعي",
    "singer": "محمد عبده",
    "id": "CgeKV7FTRkk",
    "thumbnail": "songs/mohammed.gif"
  },
  {
    "title": "ايوه حبيت",
    "singer": "انغام",
    "id": "xllhnjmKP_s",
    "thumbnail": "songs/angam.gif"
  },
  {
    "title": "تجيني يختلف حالي",
    "singer": "عايض",
    "id": "fxiShLlJ3Mo",
    "thumbnail": "songs/aieth.gif"
  },
  {
    "title": "زي الهوى",
    "singer": "اصالة",
    "id": "hlUqnQAWtKM",
    "thumbnail": "songs/assala.gif"
  },
  {
    "title": "الجرح أرحم",
    "singer": "عبادي الجوهر",
    "id": "2QuYNU_rhPo",
    "thumbnail": "songs/abady.gif"
  },
];

class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers = song
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId["id"]!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("songs/sess.jpg"),
              Expanded(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YoutubePlayer(
                                controller: _controllers[index],
                              ),
                            ));
                        _controllers[index].play();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              song[index]["thumbnail"]!,
                              fit: BoxFit.cover,
                            ),
                            Container(
                                // margin: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                color: Colors.blueAccent,
                                height: 40.0,
                                width: double.infinity,
                                child: Text(
                                  song[index]["singer"]!,
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: song.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (v) => Scaffold()));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            "انتقل لحجز التذاكر ",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
