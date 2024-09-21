import 'package:color_generator/src/screens/hello_there/hello_there_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

/// The main entry point for the Color Generator app.
///
/// This code sets up the app's [MaterialApp] widget, which provides the basic
/// structure and styling for the app. The [HelloThereScreen] widget is set as
/// the home screen of the app, which is the first screen the user sees when
/// the app is launched.
class App extends StatelessWidget {
  /// Creates a new instance of the [App] widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloThereScreen(),
    );
  }
}
