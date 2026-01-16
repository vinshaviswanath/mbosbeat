import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_shimmer.dart';

class HomeLoadingOverlay extends StatelessWidget {
  const HomeLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<UserProvider, bool>(
      selector: (_, p) => p.isLoading,
      builder: (_, isLoading, __) {
        if (!isLoading) return const SizedBox();
        return const HomeScreenShimmer();
      },
    );
  }
}