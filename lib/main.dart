import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/theme/app_theme.dart';
import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/domain/repositories/i_authentication_facad.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/route/router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency(env: Environment.test);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDetails.screenSize = MediaQuery.sizeOf(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthFormProvider(sl<IAuthenticationFacad>()),
        ),
        ChangeNotifierProvider(create: (_) => UserManagementProvider()),
        ChangeNotifierProvider(create: (_) => CustomerTransactionProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final themeMode = themeProvider.themeMode;

          return MaterialApp.router(
            scaffoldMessengerKey: AppDetails.rootScaffoldMessengerKey,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale("en"),
            title: 'mPOS Beat',

            theme: AppTheme.getTheme(themeMode, context),
            builder: (context, child) =>
                Stack(children: [child!, const DropdownAlert()]),
          );
        },
      ),
    );
  }
}
