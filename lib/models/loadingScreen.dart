import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen {
  static Widget awaitingFuture(Future awaitFuture, Widget screen) {
    return new FutureBuilder(
        future: awaitFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return screen;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              print("none");
              return Container();
              break;
          }
        }
    );
  }
}