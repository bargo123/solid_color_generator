import 'package:color_generator/src/utils/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

/// Represents the screen that displays a "Hello There" message with a randomly
/// generated background color.
///
/// The screen can be tapped to generate a new random color, and the previous
/// olor can be restored by pressing the "previous color" button.
///
/// The screen also listens for phone shakes and resets the color generator
/// when a shake is detected.
class HelloThereScreen extends StatefulWidget {
  /// Creates a new instance of the HelloThereScreen.
  const HelloThereScreen({super.key});

  @override
  State<HelloThereScreen> createState() => _HelloThereScreenState();
}

class _HelloThereScreenState extends State<HelloThereScreen> {
  ColorGenerator colorGenerator = ColorGenerator();
  ShakeDetector? detector;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          setState(() {
            colorGenerator.reset();
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colorGenerator.generateColor();
        });
      },
      child: Scaffold(
        backgroundColor: colorGenerator.currentColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello There",
                style: TextStyle(
                  color: colorGenerator.isDarkColor()
                      ? Colors.white
                      : Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    colorGenerator.isDarkColor() ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    colorGenerator.setPreviousColorToCurrent();
                  });
                },
                child: Text(
                  "previous color",
                  style: TextStyle(
                    color: colorGenerator.isDarkColor()
                        ? Colors.black
                        : Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Shake to reset color",
                style: TextStyle(
                  color: colorGenerator.isDarkColor()
                      ? Colors.white
                      : Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }
}
