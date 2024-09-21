import 'package:color_generator/src/utils/color_generator.dart';
import 'package:flutter/material.dart';

class HelloThereScreen extends StatefulWidget {
  const HelloThereScreen({super.key});

  @override
  State<HelloThereScreen> createState() => _HelloThereScreenState();
}

class _HelloThereScreenState extends State<HelloThereScreen> {
  ColorGenerator colorGenerator = ColorGenerator();
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
                    fontSize: 40),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                  colorGenerator.isDarkColor() ? Colors.white : Colors.black,
                )),
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
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
