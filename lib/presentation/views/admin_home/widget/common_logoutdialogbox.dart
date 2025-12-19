import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

void CommonLogoutDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.all(16.0),
        title: Center(
          child: Text(
            'Logout',
            style: context.textStyle.s16.roboto.bold.indigoBlue,
          ),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Column(
            children: [
              Text(
                'Are you sure to want to Logout?',
                style: context.textStyle.s14.roboto.bold.dustyBlue,
              ),
              h20,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = sl<SharedPreferences>();
                        await prefs.remove("token");

                        /// Close dialog first
                        Navigator.of(context).pop(true);

                        /// Navigate after closing dialog
                        context.pushNamed(AppRouterConst.login);
                      },
                      child: Text(
                        'Logout',
                        style: context.textStyle.s14.roboto.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.indigoBlue,
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  w10,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Cancel',
                        style: context.textStyle.s14.roboto.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.indigoBlue,
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
