import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognizer extends StatefulWidget {
  SpeechRecognizer({Key key}) : super(key: key);

  @override
  _SpeechRecognizerState createState() => _SpeechRecognizerState();
}

class _SpeechRecognizerState extends State<SpeechRecognizer> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Press the button to start speaking";
  double _confidence = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confidence: ${(_confidence * 100).toStringAsFixed(1)}%',
        ),
      ),
      backgroundColor: Palette.scaffold,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(seconds: 2),
        repeatPauseDuration: const Duration(microseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 150),
        child: SingleChildScrollView(
          child: Container(
            child: Text(
              _text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34.0,
                  color: Palette.primaryColor),
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      _text = "...";
      bool available = await _speech.initialize(
          onError: (SpeechRecognitionError e) {}, onStatus: (String str) {});
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
    }
  }
}
