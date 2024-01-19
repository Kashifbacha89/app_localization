import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, urdu }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helloWorld),
        actions: [
          PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                    const PopupMenuItem(
                        value: Language.english, child: Text('english')),
                    const PopupMenuItem(
                        value: Language.urdu, child: Text('urdu')),
                  ]),
        ],
      ),
      body: Container(),
    );
  }
}
