import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/theme/app_theme.dart';
import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/isolates/init_parsers.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/domain/repositories/i_authentication_facad.dart';
import 'package:mpos_beat/domain/repositories/i_company_creation_facad.dart';
import 'package:mpos_beat/domain/repositories/i_user_management_facad.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/route/router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency(env: Environment.test);
  initParsers();
  final db = sl<AppDb>();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final AppDb db;
  const MyApp({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    AppDetails.screenSize = MediaQuery.sizeOf(context);
    return MultiProvider(
      providers: [
        Provider<AppDb>.value(value: db),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthFormProvider(sl<IAuthenticationFacad>(), db: db),
        ),
        ChangeNotifierProvider(
          create: (_) => UserManagementProvider(sl<IUserManagementFacad>()),
        ),
        ChangeNotifierProvider(create: (_) => CustomerTransactionProvider()),
        ChangeNotifierProvider(
          create: (_) =>
              CompanyCreationProvider(sl<ICompanyCreationFacad>(), db: db),
        ),
        ChangeNotifierProvider(create: (_) => UserProvider()..load()),
        //  StreamProvider<List<CompanySettingsListData>>(
        //   create: (context) =>
        //       context.read<CompanyCreationProvider>().settingsStream,
        //   initialData: const [],
        // ),
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
            // builder: (context, child) =>
            //     Stack(children: [child!, const DropdownAlert()]),
          );
        },
      ),
    );
  }
}
