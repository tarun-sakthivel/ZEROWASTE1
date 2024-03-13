import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zerowaste111/Components/bottom_navigation_bar.dart';

class education extends StatefulWidget {
  const education({super.key});

  @override
  State<education> createState() => _educationState();
}

class _educationState extends State<education> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId:
          'ishA6kry8nc', // https://www.youtube.com/watch?v=Tb9k9_Bo-G4
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomnavigator(
        index1: 2,
      ),
      backgroundColor: Color(0xFFF4EFE9),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  "Awareness on Food Wastage",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 160,
                      width: 200,
                      child: Text(
                        'Food waste is like stealing from the table of those who are poor and hungry.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Ovo',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.38,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black87),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                          child: Image.asset("assets/Images/edu3.png"),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black87),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 80,
                          width: 110,
                          child: Image.asset("assets/Images/edu8.png"),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black87),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          child: Image.asset("assets/Images/edu6.png"),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black87),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 60,
                          width: 140,
                          child: Image.asset(
                            "assets/Images/edu7.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 160,
                      width: 170,
                      child: Image.asset(
                        "assets/Images/edu5.png",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller ??
                        YoutubePlayerController(initialVideoId: ''),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.orangeAccent,
                    ),
                  ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Related articles",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Color.fromRGBO(217, 217, 217, 1)),
                  onPressed: () async {
                    try {
                      await _launchArticleUrl(Uri.parse(
                          'https://www.hsph.harvard.edu/nutritionsource/sustainability/food-waste/'));
                    } catch (e) {
                      // Handle any potential errors here
                      print('Error launching URL: $e');
                    }
                  },
                  child: Container(
                    height: 150,
                    width: 260,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    //color: Colors.brown,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Food Waste",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                            "Food waste occurs along the entire spectrum of production, \nfrom the farm to distribution to retailers to the consumer. Reasons include...\nSee more")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Color.fromRGBO(217, 217, 217, 1)),
                  onPressed: () async {
                    try {
                      await _launchArticleUrl(Uri.parse(
                          'https://foodprint.org/issues/the-problem-of-food-waste/'));
                    } catch (e) {
                      // Handle any potential errors here
                      print('Error launching URL: $e');
                    }
                  },
                  child: Container(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "The Problem of Food Waste",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                            "Almost half of our food is wasted in the United States. How does this happen? What can we do to solve our enormous food waste problem?...\nSee more")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Color.fromRGBO(217, 217, 217, 1)),
                  onPressed: () async {
                    try {
                      await _launchArticleUrl(Uri.parse(
                          'https://www.frontiersin.org/articles/10.3389/fsufs.2019.00090/full'));
                    } catch (e) {
                      // Handle any potential errors here
                      print('Error launching URL: $e');
                    }
                  },
                  child: Container(
                    height: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sustainability Assessment of Food Waste Prevention Measures",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                            "The last few years, a lot of measures addressing food waste have been proposed and implemented. Recent literature reviews call for more evidence ....\nSee more")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchArticleUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
