// import 'dart:async';

// import 'package:clean_format/core/utils/enums.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'theme_state.dart';
// part 'theme_cubit.freezed.dart';

// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeState.initial());

//   void changeTheme(AppThemeMode mode) {
//     emit(
//       state.copyWith(
//         themeMode: mode,
//       ),
//     );
//   }

//   void setIndex(int index) {
//     emit(
//       state.copyWith(index: index),
//     );
//   }

//   void showNewWidget() {
//     emit(
//       state.copyWith(
//         bottomPosition: 0,
//         showNewWidget: true,
//         visible: true,
//       ),
//     );
//   }

//   void hideNewWidget() {
//     emit(
//       state.copyWith(
//         bottomPosition: -200,
//         showNewWidget: false,
//       ),
//     );
//     Timer(const Duration(milliseconds: 400), () {
//       emit(
//         state.copyWith(
//           visible: false,
//         ),
//       );
//     });
//   }
// }
