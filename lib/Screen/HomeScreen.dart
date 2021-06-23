import 'package:flutter/material.dart';
import 'package:fluttermovies/Widget/bigTitle.dart';

import 'package:fluttermovies/Widget/drawer.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttermovies/custom/verticalSpace.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    readNowplay();
    topRated();
    popular();
    upcoming();
    super.initState();
  }

  // Fetch content from the json file
  Future<void> readNowplay() async {
    final String response =
        await rootBundle.loadString('lib/json/nowplaying.json');
    final data = await json.decode(response);
    setState(() {
      _nowplaying = data["MovieName"];
    });
  }

  Future<void> topRated() async {
    final String response =
        await rootBundle.loadString('lib/json/top-rated.json');
    final data = await json.decode(response);
    setState(() {
      _toprated = data["MovieName"];
    });
  }

  Future<void> popular() async {
    final String response =
        await rootBundle.loadString('lib/json/popular.json');
    final data = await json.decode(response);
    setState(() {
      _popular = data["MovieName"];
    });
  }

  Future<void> upcoming() async {
    final String response =
        await rootBundle.loadString('lib/json/upcoming.json');
    final data = await json.decode(response);
    setState(() {
      _upcoming = data["MovieName"];
    });
  }

  List _nowplaying = [];
  List _toprated = [];
  List _popular = [];
  List _upcoming = [];
  @override
  Widget build(BuildContext context) {
    TextStyle style2 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 23,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        title: Text('Home'),
      ),
      drawer: DorawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Now Playing',
                style: style2,
              ),
            ),
            addVerticalSpace(10),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _nowplaying.length,
                itemBuilder: (context, index) {
                  return BigMOvieWidget(
                    gmbar: _nowplaying[index]["image"],
                    tanggal: _nowplaying[index]["date"],
                    title: _nowplaying[index]["name"],
                    urell: _nowplaying[index]["trailer_url"],
                    deskrip: _nowplaying[index]["detail"],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Rated',
                style: style2,
              ),
            ),
            addVerticalSpace(10),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _toprated.length,
                itemBuilder: (context, index) {
                  return BigMOvieWidget(
                    gmbar: _toprated[index]["image"],
                    tanggal: _toprated[index]["date"],
                    title: _toprated[index]["name"],
                    deskrip: _toprated[index]["overview"],
                    urell: _toprated[index]["selection1_url"],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popular',
                style: style2,
              ),
            ),
            addVerticalSpace(10),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _popular.length,
                itemBuilder: (context, index) {
                  return BigMOvieWidget(
                    gmbar: _popular[index]["image"],
                    tanggal: _popular[index]["date"],
                    title: _popular[index]["name"],
                    deskrip: _popular[index]["selection1"],
                    urell: _popular[index]["trailer_url"],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Upcoming',
                style: style2,
              ),
            ),
            addVerticalSpace(10),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _upcoming.length,
                itemBuilder: (context, index) {
                  return BigMOvieWidget(
                    gmbar: _upcoming[index]["image"],
                    tanggal: _upcoming[index]["date"],
                    title: _upcoming[index]["name"],
                    deskrip: _upcoming[index]["detail"],
                    urell: _upcoming[index]["video_url"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
