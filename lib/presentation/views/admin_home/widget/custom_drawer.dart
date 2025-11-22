import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/dialogs/logout_dialog.dart';
import 'package:mpos_beat/presentation/views/admin_home/admin_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _drawerWidth = MediaQuery.of(context).size.width / 1.23;
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

  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    final applocalizations = context.l10n;

    return Scaffold(
      backgroundColor: ColorResources.paleBlue,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Stack(
          children: [
            // Main child
            widget.child,

            // Menu icon
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Positioned(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.07,
                  child: GestureDetector(
                    onTap: toggleDrawer,
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    child: SvgPicture.asset(
                      AppAssets.menu,
                      height: context.getSize.height * 0.014,
                    ),
                  ),
                );
              },
            ),

            // Dark overlay when drawer is open
            if (_isDrawerOpen)
              GestureDetector(
                onTap: toggleDrawer,
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: Container(color: Colors.black. withValues(alpha: 0.3),),
              ),

            // Drawer itself
            AnimatedBuilder(
              animation: _drawerAnimation,
              builder: (context, child) {
                return Positioned(
                  left: _drawerAnimation.value,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    child: Container(
                      width: _drawerWidth,
                      decoration: const BoxDecoration(
                        color: ColorResources.darkBlue,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: SafeArea(
                        child: Column(
                          children: [
                            // --- FIXED TOP SECTION ---
                            Column(
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
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.refresh,
                                          height: 16,
                                        ),
                                        w12,
                                        NavButton(
                                          color: ColorResources.amber,
                                          svgArrowPath: AppAssets.arrowToLeft,
                                          onTap: toggleDrawer,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                h16,
                                Text(
                                  "Manvish Info Solutions Pvt Ltd.",
                                  style:
                                      context.textStyle.s14.bold.white.roboto,
                                ),
                                h4,
                                Row(
                                  children: [
                                    Text(
                                      "Bank Road, Aluva",
                                      style: context
                                          .textStyle
                                          .s10
                                          .w400
                                          .bluishGray
                                          .roboto,
                                    ),
                                    w16,
                                    SvgPicture.asset(
                                      AppAssets.edit,
                                      height: 10,
                                    ),
                                  ],
                                ),
                                h8,
                                Row(
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.55,
                                  child: Text(
                                    applocalizations.custom_drawer_note,
                                    style:
                                        context.textStyle.s10.w400.bluishGray,
                                  ),
                                ),
                                h10,
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
                                h16,
                                Divider(
                                  color: ColorResources.white.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                                h13,
                                Text(
                                  applocalizations
                                      .custom_drawer_complete_company_profile,
                                  style: context.textStyle.s10.w400.bluishGray,
                                ),
                                h8,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "38% ",
                                          style: context
                                              .textStyle
                                              .s10
                                              .w500
                                              .amber
                                              .roboto,
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
                                    Text(
                                      "100%",
                                      style: context
                                          .textStyle
                                          .s10
                                          .w500
                                          .white
                                          .roboto,
                                    ),
                                  ],
                                ),
                                h8,
                                const LinearProgressIndicator(
                                  value: 0.38,
                                  backgroundColor: Colors.white24,
                                  color: Colors.lightBlueAccent,
                                ),
                                h16,
                                Divider(
                                  color: ColorResources.white.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                                h13,
                              ],
                            ),

                            Expanded(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isExpand = !_isExpand;
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: false,
                                                side: BorderSide.none,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                visualDensity:
                                                    VisualDensity.compact,
                                                onChanged: (value) {},
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                fillColor:
                                                    WidgetStateProperty.all(
                                                      ColorResources.white
                                                          .withValues(
                                                            alpha: 0.2,
                                                          ),
                                                    ),
                                              ),
                                              w8,
                                              Text(
                                                applocalizations
                                                    .drawer_user_management,
                                                style: context
                                                    .textStyle
                                                    .s14
                                                    .bold
                                                    .white
                                                    .roboto,
                                              ),
                                            ],
                                          ),
                                          // SvgPicture.asset(
                                          //   AppAssets.roundArrowRight,
                                          //   height: 12,
                                          // ),
                                          NavButton(
                                            height: 16,
                                            color: ColorResources.indigoBlue
                                                .withValues(alpha: 0.35),
                                            svgArrowPath: AppAssets.person,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  h12,
                                  if (_isExpand) ...[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  AppRouterConst.manageUser,
                                                );
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 7,
                                                    ),
                                                width:
                                                    context.getSize.width /
                                                    1.53,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.grayD9
                                                      .withValues(alpha: 0.12),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      applocalizations
                                                          .drawer_all_users,
                                                      style: context
                                                          .textStyle
                                                          .w400
                                                          .s12
                                                          .white,
                                                    ),
                                                    SvgPicture.asset(
                                                      AppAssets.editIcon,
                                                      height: 16,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            h12,
                                            GestureDetector(
                                              onTap: () {
                                                context.pushNamed(
                                                  AppRouterConst
                                                      .userDesignation,
                                                );
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 7,
                                                    ),
                                                width:
                                                    context.getSize.width /
                                                    1.53,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.grayD9
                                                      .withValues(alpha: 0.12),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      applocalizations
                                                          .drawer_user_designation,
                                                      style: context
                                                          .textStyle
                                                          .w400
                                                          .s12
                                                          .white,
                                                    ),
                                                    SvgPicture.asset(
                                                      AppAssets.editIcon,
                                                      height: 16,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            // --- FIXED BOTTOM SECTION ---
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
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
                                          fillColor: WidgetStateProperty.all(
                                            ColorResources.white.withValues(
                                              alpha: 0.2,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          applocalizations
                                              .custom_drawer_settings,
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
                                GestureDetector(
                                  onTap: () async {
                                    // toggleDrawer();
                                    final result = await LogOutDialogs.show(
                                      context,
                                    );

                                    if (result == true) {
                                      // Logout handled inside dialog already
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: false,
                                            side: BorderSide.none,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            visualDensity:
                                                VisualDensity.compact,
                                            onChanged: (value) {},
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            fillColor: WidgetStateProperty.all(
                                              ColorResources.white.withValues(
                                                alpha: 0.2,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            applocalizations
                                                .custom_drawer_logout,
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
                                ),
                                h16,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
