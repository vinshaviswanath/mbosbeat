enum AppThemeMode {
  light,
  dark,
}

enum APIAction {
  none('mone'),
  email('email');

  const APIAction(this.name);
  final String name;
}

enum ActionType {
  // playStore('play_store'),
  profileInteraction('profile_interaction');

  const ActionType(this.name);
  final String name;
}

enum NavigationType { success, failed, }

enum TransitionDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

enum ImageType {svg, png}

enum UserAction {
  block,   
  unblock; 

  int get value {
    switch (this) {
      case UserAction.block:
        return 0;
      case UserAction.unblock:
        return 1;
    }
  }
}
