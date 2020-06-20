import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/theme_color.dart';

void main() => runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeColor, _) => MaterialApp(
        theme: themeColor.getTheme(),
        home: Scaffold(
          appBar: AppBar(title: Text('Dark Theme')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Dark Mode'),
                        Consumer<ThemeProvider>(
                            builder: (context, themeColor, _) =>
                                Text(themeColor.getText()))
                      ],
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, themeColor, _) => Switch(
                          value: themeColor.isLight,
                          onChanged: (newValue) {
                            themeColor.isLight = newValue;
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
