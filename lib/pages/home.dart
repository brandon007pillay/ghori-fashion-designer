import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gfd_official/Payment%20screens/expert_payment.dart';
import 'package:gfd_official/Playlists/basic_playlist.dart';
import 'package:gfd_official/screens/Basic_class.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {

  final List<String> basicimgList = [
    'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
  ];

  final List<String> expertimgList = [
    'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            basic_images(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Text("Aapki Basic class",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        )),
                  ],
                ),
                SizedBox(
                  width: 0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => Playlist(
                              url: 'https://gfdofficial.herokuapp.com/',
                              title: 'gfdofficial',
                            )));
                  },
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Shuru Kare",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            expert_images(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Aapki Expert class",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
                ButtonBar(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                expert_payment()));
                      },
                      hoverElevation: 20,
                      splashColor: Colors.blue,
                      color: Colors.green[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Join Kare",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            onedressimg(),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Kisi bhi dress \nmai expert bane",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => basic_class()),);
                  },
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Join Kare",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget expert_images() {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 200,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        aspectRatio: 16 / 9,
        initialPage: 1,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
      items: expertimgList.map(
        (url) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget basic_images() {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 200,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        aspectRatio: 16 / 9,
        initialPage: 1,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
      items: basicimgList.map(
        (url) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  // ignore: missing_return
  Widget onedressimg() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
          fit: BoxFit.fill,
          width: 1000,
        ),
      ),
    );
  }
}
