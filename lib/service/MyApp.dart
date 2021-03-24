import 'package:careergati/service/HomeRes.dart';
import 'package:careergati/service/RestClient.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Application',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: Text(
            'Posts',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  FutureBuilder<HomeRes> _buildBody(BuildContext context) {
    final client = RestClient(Dio(BaseOptions()));
    return FutureBuilder<HomeRes>(
      future: client.fetchPropertyListing(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final HomeRes posts = snapshot.data;
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, HomeRes posts) {
    print('kaif $posts.length');

    return ListView.builder(
      itemCount: posts.data.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts.data[index].buildingName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts.data[index].price),
          ),
        );
      },
    );
  }
}
