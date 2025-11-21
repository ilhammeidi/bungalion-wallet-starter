import 'package:ewallet_app/screens/home.dart';
import 'package:ewallet_app/screens/intro/intro_screen.dart';
import 'package:ewallet_app/ui/layouts/general_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final String _key = 'finishedIntro';
  bool _isFinishedIntro = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _checkFinishedIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFinishedIntro = prefs.getBool(_key) ?? false;
    });
  }

  Future<void> _saveIntroStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool(_key, true);
    setState(() {
      _isFinishedIntro = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkFinishedIntro();
  }

  @override
  Widget build(BuildContext context) {
    return _isFinishedIntro ?
      const GeneralLayout(content: Home())
      : IntroScreen(saveIntroStatus: () {
        _saveIntroStatus();
      }
    );
  }
}