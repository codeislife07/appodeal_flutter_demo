import 'dart:async';
import 'dart:io';

import 'package:appodeal_flutter_demo/banner.dart';
import 'package:appodeal_flutter_demo/banner_view.dart';
import 'package:appodeal_flutter_demo/interstitial.dart';
import 'package:appodeal_flutter_demo/mrec_view.dart';
import 'package:appodeal_flutter_demo/rewarded_video.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: AppodealDemoApp(),
  ));
}

class AppodealDemoApp extends StatefulWidget {
  @override
  _AppodealDemoAppState createState() => _AppodealDemoAppState();
}

class _AppodealDemoAppState extends State<AppodealDemoApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> initialization() async {
    Appodeal.setTesting(kReleaseMode ? false : true); //only not release mode
    Appodeal.setLogLevel(Appodeal.LogLevelVerbose);

    Appodeal.setAutoCache(AppodealAdType.Interstitial, false);
    Appodeal.setAutoCache(AppodealAdType.RewardedVideo, false);
    Appodeal.setUseSafeArea(true);

    Appodeal.initialize(
        appKey: _appodealKey,
        adTypes: [
          AppodealAdType.RewardedVideo,
          AppodealAdType.Interstitial,
          AppodealAdType.Banner,
          AppodealAdType.MREC
        ],
        onInitializationFinished: (errors) {
          errors?.forEach((error) => print(error.desctiption));
          print("onInitializationFinished: errors - ${errors?.length ?? 0}");
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Appodeal Flutter Demo', style: TextStyle(fontSize: 20)),
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 4.0, right: 4.0, top: 8.0, bottom: 4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(300, 20)),
                  onPressed: () {
                    initialization();
                  },
                  child: const Text('INITIALIZATION'),
                ),
              ),
            ],
          ),
          //Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 4.0, right: 4.0, top: 8.0, bottom: 4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(300, 20)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InterstitialPage()),
                    );
                  },
                  child: const Text('INTERSTITIAL'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(300, 20)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RewardedVideoPage()),
                    );
                  },
                  child: const Text('REWARDED VIDEO'),
                ),
              ),
            ],
          ),
          //Interstitial
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(300, 20)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BannerPage()),
                    );
                  },
                  child: const Text('BANNER'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(300, 20)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BannerViewPage()),
                    );
                  },
                  child: const Text('BANNER VIEW'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(300, 20)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MrecViewPage()),
                    );
                  },
                  child: const Text('MREC VIEW'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

//This is test key
final String _appodealKey =
  Platform.isAndroid
      ? "d908f77a97ae0993514bc8edba7e776a36593c77e5f44994"
      : "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f";