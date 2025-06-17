import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int duration;
  final VoidCallback? onFinished;

  const CountdownTimer({
    Key? key,
    this.duration = 20,
    this.onFinished,
  }) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _remaining = widget.duration;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(!mounted) return;
      if (_remaining > 0) {
        setState(() {
          _remaining--;
        });
      } else {
        timer.cancel();
        if(widget.onFinished != null){
          widget.onFinished!();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Cercle de progression
          CircularProgressIndicator(
            value: _remaining / widget.duration,
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
          ),
          Text(
            '$_remaining',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
