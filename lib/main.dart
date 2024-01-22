import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/controllers/language_change_controller.dart';
import 'package:flutter_localization/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? '';
  runApp(MyApp(
    language: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String language;
  const MyApp({super.key, required this.language});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LanguageChangeController()),
        ],
        child: Consumer<LanguageChangeController>(
          builder: (context, provider, child) {
            if (language.isEmpty) {
              provider.changeLanguage(const Locale('en'));
            }
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: language == ''
                  ? const Locale('en')
                  : provider.appLanguage ?? const Locale('en'),
              supportedLocales: const [
                Locale('en'),
                Locale('ur'),
              ],
              home: const HomeScreen(),
            );
          },
        ));
  }
}
