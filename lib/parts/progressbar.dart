import 'package:flutter/material.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:provider/provider.dart';

class LevelProgress extends StatefulWidget {
  const LevelProgress({Key? key}) : super(key: key);

  @override
  State<LevelProgress> createState() => _LevelProgressState();
}

class _LevelProgressState extends State<LevelProgress> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginInfo>(
      builder: (context, loginInfo, child) {
        int level = loginInfo.user!.level;
        double progress = loginInfo.user!.progress;
        return IntrinsicWidth(
          // Wrap with IntrinsicWidth
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch the children
            children: [
              Text(
                "Level $level",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4), // Space between text and progress bar
              LinearProgressIndicator(
                  value: progress,
                  minHeight: 4,
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
            ],
          ),
        );
      },
    );
  }
}
