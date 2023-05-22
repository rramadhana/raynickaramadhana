import 'package:flutter/material.dart';
import 'bantuan.dart';
import 'main.dart';
import 'stopwatch.dart';
import 'situsRekomendasi.dart';
import 'favorit.dart';
import 'main.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StopwatchApp(),
                  ),
                );
              },
              child: Text('Stopwatch'),
            ),
            SizedBox(width: 20, height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Rekomendasi(),
                  ),
                );
              },
              child: Text('Rekomendasi'),
            ),
            SizedBox(width: 20, height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorit(),
                  ),
                );
              },
              child: Text('Favorit'),
            ),
            SizedBox(width: 20, height:20),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => bantuan(),
                ),
              );
            },
            child: Icon(Icons.help),
            backgroundColor: Colors.blue,
          ),
          Expanded(child: Container()),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
            child: Icon(Icons.logout),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
