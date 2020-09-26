import 'package:flutter/material.dart';
import 'package:flutter_app/features/speech_recognition/presentation/widgets/speech_recognizer.dart';

class SpeechRecognitionPage extends StatelessWidget {
  const SpeechRecognitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpeechRecognizer(),
    );
  }
}
