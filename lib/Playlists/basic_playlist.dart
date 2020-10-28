import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfd_official/screens/Video_screen.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Playlist extends StatefulWidget {
  Playlist({this.title, this.url});

  final String title;
  final String url;

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Aapki Basic class'),
        centerTitle: true,
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new basicListVideo(list: snapshot.data)
              : new CircularProgressIndicator();
        },
      ),
    );
  }
}

// ignore: camel_case_types
class basicListVideo extends StatelessWidget {
  final List list;

  basicListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new VideoScreen(
                            id: '${list[i]['contentDetails']['videoId']}',
                          )),
                ),
                child: new Container(
                  height: 190.0,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    image: new NetworkImage(
                        list[i]['snippet']['thumbnails']['high']['url']),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Divider(
                height: 3,
                thickness: 1.5,
              ),
              new Padding(
                padding: const EdgeInsets.all(2.5),
              ),
              new Text(
                list[i]['snippet']['title'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                height: 10,
                thickness: 1.5,
              ),
            ],
          ),
        );
      },
    );
  }
}
