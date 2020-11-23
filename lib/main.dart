import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:lichamduong/src/presentation/splash/splash_screen.dart';
import 'package:lichamduong/src/resource/repo/more_app_repository.dart';
import 'package:lichamduong/src/resource/services/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/configs/configs.dart';
import 'src/presentation/presentation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(child: MyApp(), providers: <SingleChildWidget>[
    Provider.value(value: MoreAppRepository())
  ]));
  setupLocator();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppDefaults.APP_NAME,
      theme: normalTheme(context),
      supportedLocales: AppLanguage.getSupportLanguage().map((e) => e.locale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          debugPrint("*language locale is null!!!");
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      locale: Locale('vi', 'VN'),
      home: SplashScreen(),
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
