import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/imports.dart';

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
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {},
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
                  SizedBox(width: 10),
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
