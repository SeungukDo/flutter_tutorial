import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Named Routes Demo',
  initialRoute: '/',
  routes: {
    '/': (context) => FirstScreen(),
    '/second': (context) => SecondScreen(),
    ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
  },
));

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArgument';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Navigate to screen that extracts arguments'),
          onPressed: () {// When the user taps the button, navigate to the specific route
            // and provide the arguments as part of the RouteSettings.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExtractArgumentsScreen(),
                // Pass the arguments as part of the RouteSettings. The
                // ExtractArgumentScreen reads the arguments from these
                // settings.
                settings: RouteSettings(
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class ScreenArguments{
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}