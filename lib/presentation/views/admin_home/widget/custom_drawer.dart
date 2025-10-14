import 'package:mpos_beat/core/utils/imports.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;

  const CustomDrawer({super.key, required this.child});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  bool _isDrawerOpen = false;
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;
  double _drawerWidth = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400), // unified duration
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _drawerWidth = context.getSize.width / 1.33;
    final begin = -_drawerWidth;
    _drawerAnimation = Tween<double>(
      begin: begin,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final delta = details.primaryDelta ?? 0;
    // negative delta when dragging left, positive when dragging right
    final fractionDelta = delta / _drawerWidth;
    _controller.value = (_controller.value + fractionDelta).clamp(0.0, 1.0);
  }

  void _onDragEnd(DragEndDetails details) {
    final vx = details.velocity.pixelsPerSecond.dx;
    if (vx.abs() > 300) {
      if (vx > 0) {
        _controller.fling(velocity: 1.0);
        _isDrawerOpen = true;
      } else {
        _controller.fling(velocity: -1.0);
        _isDrawerOpen = false;
      }
    } else {
      if (_controller.value > 0.5) {
        _controller.forward();
        _isDrawerOpen = true;
      } else {
        _controller.reverse();
        _isDrawerOpen = false;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final applocalizations = context.l10n;
    return Scaffold(
      body: Stack(
        children: [
          widget.child,

          /// Custom drawer
          AnimatedBuilder(
            animation: _drawerAnimation,
            builder: (context, child) {
              return Positioned(
                left: _drawerAnimation.value,
                top: 0,
                bottom: 0,
                child: Container(
                  // width: 340,
                  width: context.getSize.width / 1.33,
                  decoration: const BoxDecoration(
                    color: ColorResources.darkBlue,
                    border: Border(
                      right: BorderSide(
                        color: ColorResources.lightBlue,
                        width: 4,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        /// --- Header Section ---
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppAssets.companyImage,
                                    height: 60,
                                  ),
                                  SvgPicture.asset(
                                    AppAssets.refresh,
                                    height: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Manvish Info Solutions Pvt Ltd.",
                                style: context.textStyle.s14.bold.white.roboto,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "Bank Road, Aluva",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  w16,
                                  SvgPicture.asset(AppAssets.edit, height: 10),
                                ],
                              ),

                              /// Contact Info
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${applocalizations.custom_drawer_mob} 9876543210",
                                        style: context
                                            .textStyle
                                            .s08
                                            .w300
                                            .bluishGray
                                            .bluishGray,
                                      ),
                                      w4,
                                      SvgPicture.asset(
                                        AppAssets.verified,
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                  w12,
                                  Row(
                                    children: [
                                      Text(
                                        "${applocalizations.custom_drawer_email} sales@company.com",
                                        style: context
                                            .textStyle
                                            .s08
                                            .w300
                                            .bluishGray
                                            .bluishGray,
                                      ),
                                      w4,
                                      SvgPicture.asset(
                                        AppAssets.verified,
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorResources.white.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              h14,
                              SizedBox(
                                width: context.getSize.width / 1.55,
                                child: Text(
                                  applocalizations.custom_drawer_note,
                                  style: context.textStyle.s10.w400.bluishGray,
                                ),
                              ),
                              h10,

                              /// Upgrade Button
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13.5,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorResources.amber,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  applocalizations
                                      .custom_drawer_upgrade_To_premium,
                                  style:
                                      context.textStyle.s10.w500.white.roboto,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Divider(
                                color: ColorResources.white.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              h13,

                              /// Progress Bar
                              Text(
                                applocalizations
                                    .custom_drawer_complete_company_profile,
                                style: context.textStyle.s10.w400.bluishGray,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "38% ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        applocalizations
                                            .custom_drawer_completed,
                                        style: context
                                            .textStyle
                                            .s09
                                            .w400
                                            .bluishGray,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "100%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              h8,
                              const Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: 0.38,
                                      backgroundColor: Colors.white24,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Divider(
                                color: ColorResources.white.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              h13,
                            ],
                          ),
                        ),

                        /// --- Menu Items Section ---
                        SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: false,
                                        side: BorderSide.none,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        onChanged: (value) {},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        fillColor: WidgetStatePropertyAll(
                                          ColorResources.white.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${applocalizations.custom_drawer_menu} ${index + 1}",
                                        style: context
                                            .textStyle
                                            .s14
                                            .bold
                                            .white
                                            .roboto,
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    AppAssets.roundArrowRight,
                                    height: 12,
                                  ),
                                ],
                              ),
                            );
                          }, childCount: 5),
                        ),

                        /// --- Bottom Section ---
                        SliverFillRemaining(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: false,
                                        side: BorderSide.none,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        onChanged: (value) {},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        fillColor: WidgetStatePropertyAll(
                                          ColorResources.white.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        applocalizations.custom_drawer_settings,
                                        style: context
                                            .textStyle
                                            .s14
                                            .bold
                                            .white
                                            .roboto,
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    AppAssets.roundArrowRight,
                                    height: 12,
                                  ),
                                ],
                              ),
                              h12,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: false,
                                        side: BorderSide.none,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        onChanged: (value) {},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        fillColor: WidgetStatePropertyAll(
                                          ColorResources.white.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        applocalizations.custom_drawer_logout,
                                        style: context
                                            .textStyle
                                            .s14
                                            .bold
                                            .white
                                            .roboto,
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    AppAssets.roundArrowRight,
                                    height: 12,
                                  ),
                                ],
                              ),
                              h16,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          /// Drawer Control Button
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Positioned(
                // : const Duration(milliseconds: 400),
                left: _controller.value * _drawerWidth,
                top: MediaQuery.of(context).size.height / 2 - 25,
                child: GestureDetector(
                  onTap: toggleDrawer,
                  onHorizontalDragUpdate: _onDragUpdate,
                  onHorizontalDragEnd: _onDragEnd,
                  child: Container(
                    height: 50,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: ColorResources.lightBlue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Icon(
                      _isDrawerOpen
                          ? Icons.keyboard_arrow_left
                          : Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
