import 'package:flutter/material.dart';
import 'gen_l10n/app_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization Demo',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var items = [
  'English',
  'Spanish',
  'Mexican Spanish',
];

String dropdownvalue = 'English';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localization Demo"),
        actions: [
          DropdownButton(
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              late Locale loc;
             if (newValue == "English") {
                loc = const Locale('en', '');
              } else if (newValue == "Spanish") {
                loc = const Locale('es', '');
              }
              if (newValue == "Mexican Spanish") {
                loc = const Locale('es', 'MX');
              }
              MyApp.setLocale(context, loc);
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.language),
            Text(AppLocalizations.of(context)!.glasses),
          ],
        ),
      ),
    );
  }
}
