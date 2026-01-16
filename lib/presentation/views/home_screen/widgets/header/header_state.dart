class HeaderState {
  final bool dayStarted;
  final bool routeStarted;
  final String? routeName;

  const HeaderState({
    required this.dayStarted,
    required this.routeStarted,
    required this.routeName,
  });

  @override
  bool operator ==(Object other) =>
      other is HeaderState &&
      dayStarted == other.dayStarted &&
      routeStarted == other.routeStarted &&
      routeName == other.routeName;

  @override
  int get hashCode =>
      dayStarted.hashCode ^ routeStarted.hashCode ^ routeName.hashCode;
}