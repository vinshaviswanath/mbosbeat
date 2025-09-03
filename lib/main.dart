import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/theme/app_theme.dart';
import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/route/router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency(env: Environment.test);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppDetails.screenSize = MediaQuery.sizeOf(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final themeMode = themeProvider.themeMode;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => AuthFormProvider(),
              ),
            ],
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              // navigatorKey: AppDetails.globalNavigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: const Locale("en"),
              title: 'mPOS Beat',
              // onGenerateRoute: AppRoute.onGenerateRoute,
              // initialRoute: SplashScreen.routeName,
              theme: AppTheme.getTheme(AppThemeMode.light),
              darkTheme: AppTheme.getTheme(AppThemeMode.dark),
              themeMode: themeMode == AppThemeMode.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
              builder: (context, child) => Stack(
                children: [
                  child!,
                  const DropdownAlert(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
