import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({Key? key});
  @override
  StopwatchAppState createState() => StopwatchAppState();
}

class StopwatchAppState extends State<StopwatchApp>
    with SingleTickerProviderStateMixin {
  Stopwatch stopwatch = Stopwatch();
  bool stopwatchrun = false;
  List<String> history = [];

  late Ticker ticker;
  String _elapsedTime = '0.0.0';

  @override
  void initState() {
    super.initState();
    ticker = createTicker((elapsed) {
      setState(() {
        _elapsedTime = formatTime(stopwatch.elapsedMilliseconds);
      });
    });
  }

  @override
  void dispose() {
    ticker.dispose();
    stopwatch.stop();
    super.dispose();
  }

  void _startStopwatch() {
    setState(() {
      stopwatchrun = true;
      stopwatch.start();
      ticker.start();
    });
  }

  void stopStopwatch() {
    setState(() {
      stopwatchrun = false;
      stopwatch.stop();
      ticker.stop();
      history.add(formatTime(stopwatch.elapsedMilliseconds));
    });
  }

  void ResetStopwatch() {
    setState(() {
      stopwatchrun = false;
      stopwatch.reset();
      ticker.stop();
      _elapsedTime = '0.0.0';
      history.clear();
    });
  }

  String formatTime(int milliseconds) {
    int seconds = (milliseconds ~/ 1000) % 60;
    int minutes = (milliseconds ~/ 60000) % 60;
    int hours = (milliseconds ~/ 3600000);
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                _elapsedTime,
                key: ValueKey<String>(_elapsedTime),
                style: TextStyle(fontSize: 80.0),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: !stopwatchrun ? _startStopwatch : null,
                  child: Text('Start'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: stopwatchrun ? stopStopwatch : null,
                  child: Text('Stop'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: ResetStopwatch,
                  child: Text('Reset'),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'History',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Column(
              children: history.map((time) => Text(time)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
