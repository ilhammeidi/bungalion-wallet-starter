import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationProcess extends StatefulWidget {
  const AnimationProcess({super.key});

  @override
  State<AnimationProcess> createState() => _AnimationProcessState();
}

class _AnimationProcessState extends State<AnimationProcess> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = AssetLottie('assets/animations/check.json').load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
      ),
      child: FutureBuilder<LottieComposition>(
        future: _composition,
        builder: (context, snapshot) {
          var composition = snapshot.data;
          if (composition != null) {
            return Lottie(composition: composition);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}